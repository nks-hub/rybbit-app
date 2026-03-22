import 'package:flutter_test/flutter_test.dart';
import 'package:rybbit_unofficial/shared/models/session.dart';
import 'package:rybbit_unofficial/shared/utils/user_display_name.dart';

AnalyticsSession _session({
  String sessionId = 'sess-1',
  String? userId,
  String? identifiedUserId,
  Map<String, dynamic>? traits,
}) {
  return AnalyticsSession(
    sessionId: sessionId,
    userId: userId,
    identifiedUserId: identifiedUserId,
    traits: traits,
  );
}

void main() {
  group('getUserDisplayName priority', () {
    test('traits.username has highest priority', () {
      final session = _session(
        userId: 'uid-1',
        identifiedUserId: 'identified-1',
        traits: {
          'username': 'john_doe',
          'name': 'John Doe',
          'email': 'john@example.com',
        },
      );
      expect(getUserDisplayName(session), 'john_doe');
    });

    test('traits.name used when username is absent', () {
      final session = _session(
        userId: 'uid-1',
        identifiedUserId: 'identified-1',
        traits: {
          'name': 'John Doe',
          'email': 'john@example.com',
        },
      );
      expect(getUserDisplayName(session), 'John Doe');
    });

    test('traits.email used when username and name are absent', () {
      final session = _session(
        userId: 'uid-1',
        identifiedUserId: 'identified-1',
        traits: {'email': 'john@example.com'},
      );
      expect(getUserDisplayName(session), 'john@example.com');
    });

    test('identifiedUserId used when traits are null', () {
      final session = _session(
        userId: 'uid-1',
        identifiedUserId: 'identified-1',
      );
      expect(getUserDisplayName(session), 'identified-1');
    });

    test('identifiedUserId used when traits are empty map', () {
      final session = _session(
        userId: 'uid-1',
        identifiedUserId: 'identified-1',
        traits: {},
      );
      expect(getUserDisplayName(session), 'identified-1');
    });

    test('generates name from userId when no traits or identifiedUserId', () {
      final session = _session(userId: 'uid-abc123');
      final name = getUserDisplayName(session);
      expect(name, isNotEmpty);
      expect(name, isNot('Anonymous'));
    });

    test('returns Anonymous when userId is null and no other data', () {
      final session = _session();
      expect(getUserDisplayName(session), 'Anonymous');
    });

    test('returns Anonymous when userId is empty', () {
      final session = _session(userId: '');
      expect(getUserDisplayName(session), 'Anonymous');
    });

    test('empty username in traits falls through to name', () {
      final session = _session(
        traits: {'username': '', 'name': 'Jane'},
      );
      expect(getUserDisplayName(session), 'Jane');
    });

    test('empty name in traits falls through to email', () {
      final session = _session(
        traits: {'name': '', 'email': 'jane@example.com'},
      );
      expect(getUserDisplayName(session), 'jane@example.com');
    });
  });

  group('generateName', () {
    test('is deterministic for the same userId', () {
      const id = 'user-12345';
      expect(generateName(id), generateName(id));
    });

    test('produces different names for different userIds', () {
      expect(generateName('user-001'), isNot(generateName('user-002')));
    });

    test('returns Color Animal format (two words)', () {
      final name = generateName('test-user');
      final parts = name.split(' ');
      expect(parts.length, 2);
    });

    test('always returns same name across multiple calls', () {
      const id = 'stable-id-xyz';
      final first = generateName(id);
      for (var i = 0; i < 10; i++) {
        expect(generateName(id), first);
      }
    });

    test('handles single character id', () {
      expect(() => generateName('a'), returnsNormally);
      expect(generateName('a').split(' ').length, 2);
    });

    test('handles long id', () {
      const longId = 'a-very-long-user-identifier-string-12345678901234567890';
      expect(() => generateName(longId), returnsNormally);
      expect(generateName(longId).split(' ').length, 2);
    });
  });

  group('isIdentified', () {
    test('returns true when identifiedUserId is non-empty', () {
      final session = _session(identifiedUserId: 'user-42');
      expect(isIdentified(session), true);
    });

    test('returns false when identifiedUserId is null', () {
      final session = _session();
      expect(isIdentified(session), false);
    });

    test('returns false when identifiedUserId is empty string', () {
      final session = _session(identifiedUserId: '');
      expect(isIdentified(session), false);
    });
  });
}
