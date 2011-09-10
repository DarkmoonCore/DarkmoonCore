SET NAMES utf8;

DROP TABLE IF EXISTS `jail`;
CREATE TABLE `jail` (
  `guid` int(11) unsigned NOT NULL,
  `char` varchar(13) NOT NULL,
  `release` int(11) unsigned NOT NULL,
  `reason` varchar(255) NOT NULL,
  `times` int(11) unsigned NOT NULL,
  `gmacc` int(11) unsigned NOT NULL,
  `gmchar` varchar(13) NOT NULL,
  `lasttime` int(11) unsigned NOT NULL,
  `duration` int(11) unsigned NOT NULL,
  `btimes` int(11) unsigned NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `jail_conf`;
CREATE TABLE `jail_conf` (
  `max_jails` int(11) unsigned NOT NULL default '3',
  `max_duration` int(11) unsigned NOT NULL default '720',
  `min_reason` int(11) unsigned NOT NULL default '40',
  `warn_player` tinyint(4) NOT NULL default '1',
  `ally_x` float NOT NULL default '-8673.43',
  `ally_y` float NOT NULL default '631.795',
  `ally_z` float NOT NULL default '96.9406',
  `ally_o` float NOT NULL default '2.1785',
  `ally_m` int(11) unsigned NOT NULL default '0',
  `horde_x` float NOT NULL default '2179.85',
  `horde_y` float NOT NULL default '-4763.96',
  `horde_z` float NOT NULL default '54.911',
  `horde_o` float NOT NULL default '4.44216',
  `horde_m` int(11) unsigned NOT NULL default '1',
  `del_char` tinyint(4) NOT NULL default '0',
  `ban_acc` tinyint(4) NOT NULL default '1',
  `ban_duration` int(11) unsigned NOT NULL default '168',
  `radius` int(11) unsigned NOT NULL default '10',
  `enabled` tinyint(4) NOT NULL default '0',
  `gm_acc` int(11) unsigned NOT NULL default '2019794',
  `gm_char` varchar(13) NOT NULL default 'Robotron',
  `amnesty` int(11) unsigned NOT NULL default '3',
  PRIMARY KEY  (`max_jails`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;