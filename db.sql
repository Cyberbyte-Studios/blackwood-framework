CREATE TABLE `players` (
  `id` int(12) NOT NULL,
  `name` varchar(32) NOT NULL,
  `pid` varchar(64) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bank` int(100) NOT NULL DEFAULT '0',
  `gear` text NOT NULL,
  `vgear` text NOT NULL,
  `licenses` text NOT NULL,
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donorlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pid` (`pid`),
  ADD KEY `name` (`name`);

CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `classname` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `gear` text NOT NULL,
  `fuel` double NOT NULL DEFAULT '1',
  `damage` varchar(256) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;
