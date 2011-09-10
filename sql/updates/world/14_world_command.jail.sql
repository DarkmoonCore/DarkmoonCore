SET NAMES utf8;

DELETE FROM `command` WHERE `name` LIKE '%jail%';
INSERT INTO `command` (name, security, help) VALUES
('jail info',       0, 'Syntax: .jail info\nGives you info about jailed players.'),
('jail goto',       0, 'Syntax: .jail goto Fracion (horde/ally)\nTeleportation to jail.'),
('jail pinfo',      1, 'Syntax: .jail pinfo [Character]\nGives jail info about selected player.'),
('jail arrest',     2, 'Syntax: .jail arrest Character Stunden Grund\nBuchtet den Charakter fur Stunden aus dem Grund ein.'),
('jail release',    2, 'Syntax: .jail release Charakter\nEntlasst den Charakter aus dem Knast.'),
('jail reset',      2, 'Syntax: .jail reset [Charakter]\nGibt dem selektiertem, oder angegebenen Charakter, wieder eine weisse Weste.\nAls ware nie etwas geschehen. ;-)\nAmnasty International lasst grussen! :D'),
('jail reload',     2, 'Syntax: .jail reload\nLadt die Jail-Konfiguration und die Inhaftierungen neu aus der Datenbank.'),
('jail enable',     2, 'Syntax: .jail enable\nSchaltet das Jail ein.'),
('jail disable',    2, 'Syntax: .jail disable\nSchaltet das Jail aus.'),
('jail delete',     3, 'Syntax: .jail delete\nWie reset, aber loscht auch Jails mit Bannungen!\nDie Bannung wird dadurch auch geloscht!');