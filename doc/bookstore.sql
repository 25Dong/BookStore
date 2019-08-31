/*
Navicat MySQL Data Transfer

Source Server         : 阿里云-mark-7561669Dong!
Source Server Version : 50722
Source Host           : 47.95.13.238:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-08-31 20:33:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad_info`
-- ----------------------------
DROP TABLE IF EXISTS `ad_info`;
CREATE TABLE `ad_info` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `RelaseDate` datetime DEFAULT NULL,
  `adPhoto` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of ad_info
-- ----------------------------

-- ----------------------------
-- Table structure for `book_inf`
-- ----------------------------
DROP TABLE IF EXISTS `book_inf`;
CREATE TABLE `book_inf` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `bookAmount` int(11) NOT NULL,
  `bookIntroduction` varchar(255) DEFAULT NULL,
  `bookPrss` varchar(255) DEFAULT NULL,
  `bookSales` int(11) NOT NULL,
  `bookShelvetDate` datetime DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `photoname` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of book_inf
-- ----------------------------
INSERT INTO `book_inf` VALUES ('1', '菲利普-迪克', '140', '小说以牵引情节，通过对不同阶层、不同身份的人物的穿插描述，讲述了一个反转过来的历史同盟国在二战中战败，美国被德国和日本分割霸占，探讨了正义与非正义、文化自卑和身份认同，以及法西斯独裁和种族歧视给人类社会造成的后果。', '译林出版社', '0', '2017-06-14 14:37:10', '热门小说', '《高城堡里的人》', '高城堡里的人.png', '45');
INSERT INTO `book_inf` VALUES ('2', '伊斯梅尔-卡达莱', '500', '15世纪，奥斯曼帝国出兵围攻阿尔巴尼亚的城堡，帕夏率领千军万马驻扎城脚，千奇百怪的攻城方式轮番上演，百转千回的军委会派系斗争层出不穷。第一次踏上战场的士兵手忙脚乱地冲锋陷阵，预示着下雨的雨鼓声犹如上帝的怒吼……', '浙江文艺出版社', '0', '2017-06-14 14:44:07', '热门小说', '《雨鼓》', '雨鼓.png', '26');
INSERT INTO `book_inf` VALUES ('3', '罗琳', '517', '哈利波特小说主角，一岁时父母被伏地魔杀害，被姨妈收养，后到霍格沃茨魔法学校学习魔法。德思礼哈利的姨父。 佩妮德思礼：哈利的姨妈。', '北京理工大学出版社', '6', '2017-06-14 14:53:14', '热门小说', '《哈利波特与魔法石》', '哈利波特与魔法石.png', '45');
INSERT INTO `book_inf` VALUES ('4', '吕新', '485', '《白杨木的春天》叙述了曾怀林一家在特殊年代的遭遇。没有贯穿始终的事件，也没有剧烈的冲突，曾怀林对自己背负的一切默默承受，妻子自杀，自己劳改。。。。', '花城出版社', '4', '2017-06-14 14:57:54', '热门小说', '《白杨木的春天》', '白杨木的春天.png', '74');
INSERT INTO `book_inf` VALUES ('5', '周梅森', '897', '为充分展现中央“坚持以零容忍态度惩治腐败”的反腐精神和国家当前轰轰烈烈。。', '北京十月文艺出版社', '0', '2017-06-14 15:01:23', '热门小说', '《人民的名义》', '人民的名义.png', '39');
INSERT INTO `book_inf` VALUES ('6', '沈从文', '752', '《边城》以二十世纪三十年代川湘交界的边城小镇茶峒为背景，以兼具抒情诗和小品文的优美笔触，描绘了湘西地区特有的风土人情；借船家少女翠翠的爱情悲剧，凸显出人性的善良美好与心灵的澄澈纯净', ' 浙江文艺出版社', '0', '2017-06-14 15:03:17', '热门小说', '《边城》', '边城.png', '45');
INSERT INTO `book_inf` VALUES ('7', '巴克曼', '156', '《外婆的道歉信》七岁的爱莎有个古怪又疯狂的外婆，会埋伏在雪堆里吓唬邻居，把重要的事情记在墙上因为墙不会丢，半夜从医院溜出来带着爱莎翻进动物园，在阳台上用彩弹枪射击推销员，基本上想干什么就干什么。这个四处惹麻烦的外婆却是爱莎**的朋友，也是她心中的超级英雄。', '天津人民出版社', '0', '2017-06-14 15:06:33', '热门小说', '《外婆的道歉信》', '外婆的道歉信.png', '45');
INSERT INTO `book_inf` VALUES ('8', '东野圭吾', '775', '一个深藏内心的秘密究竟有多大杀伤力？哲朗与美月久别重逢，十年前的一夜缱绻如在昨日，但眼前一切恍若隔世：昔日风姿曼妙的她，如今形容举止竟全如男子！更令哲朗震惊的是，她自称刚杀过人，并爆出一个更大的秘密。哲朗身不由己地卷入了一个越来越大的旋涡，越卷越深。他猛然发现，美月及那起命案的真相早已超出所有人的想象……', '南海出版公司', '0', '2017-06-14 15:08:35', '热门小说', '《单恋》', '单恋.png', '45');
INSERT INTO `book_inf` VALUES ('9', '曼德拉', '453', '曼德拉是我们这个时代最令人鼓舞的偶像之一。在曼德拉的一生中，他用纸和笔记录着自己的所思所想、大小事件、艰难险阻以及诸多成就。现在，他将这些私人档案公之于世，让我们有这次前所未有的机会了解他波澜壮阔的一生。', '中信出版社', '3', '2017-06-14 16:22:59', '人物传记', '《与自己对话》', '与自己对话.png', '56');
INSERT INTO `book_inf` VALUES ('10', '桑妮', '456', '她虽生于乱世，却自始至终怀有一颗与世无争之心。外界给了她颇多赞誉坚韧、从容、睿智、但这些于她不过浮华如花，开过即谢，她并不曾为此动容，不曾改变过一分一毫。她始终还是那个如深谷幽兰般的女子，在岁月里温婉如初。', '湖南文艺出版社', '0', '2017-06-14 16:25:17', '人物传记', '《且以优雅过一生》', '且以优雅过一生.png', '60');
INSERT INTO `book_inf` VALUES ('11', '李开复', '756', '《世界因你不同：李开复自传》是李开复唯一的一本自传，字里行间，是岁月流逝中沉淀袭来的宝贵的人生智慧和职场经验。捣蛋的“小皇帝”，11岁的“留学生”，26岁获得《商业周刊》“最重要的科学发明”奖', '中信出版社', '0', '2017-06-14 16:27:01', '人物传记', '《世界因你而不同》', '世界因你而不同.png', '75');
INSERT INTO `book_inf` VALUES ('12', '桑德博格', '785', '向前一步》曾连续7周稳居亚马逊总榜第一！超过8周长踞《纽约时报》非虚构类畅销书排行榜第一名！', '中信出版社', '4', '2017-06-14 16:29:10', '人物传记', '《向前一步》', '向前一步.png', '46');
INSERT INTO `book_inf` VALUES ('13', '杨发兴', '156', '一千多年过去了，依然有很多人对神秘繁华的大唐盛世充满谜团，而唐太宗李世民的一生，无疑是最为隆重的一笔。他幼年熟读兵法，少年投身行伍；隋末群雄逐鹿，他与父兄推翻了隋末的残暴政权，建立李唐王朝；“玄武门之变”继而夺取得皇太子的地位，从此君临天下。他一生心系万民，勤奋工作。他的任人唯贤、从谏如流、勤俭治国的作风更堪称历代帝王的典范，从而开创了大唐盛世。让我们带着景仰去了解这位神秘的千古大帝，了解隋末唐初风云变幻。', '延边人民出版社', '0', '2017-06-14 16:30:55', '人物传记', '《唐太宗李世明》', '唐太宗李世明.png', '89');
INSERT INTO `book_inf` VALUES ('14', '杨澜', '788', '这本书是继1996年《凭海临风》之后，著名媒体人杨澜女士20年来，全新个人创作的散文作品集，杨澜以“大女生”的视角，讲述她的婚姻、她的儿女、她的家庭、她理解的幸福力', '江苏凤凰文艺出版社', '0', '2017-06-14 16:32:34', '人物传记', '《世界很大，幸好有你》', '世界很大幸好有你.png', '49');
INSERT INTO `book_inf` VALUES ('15', '克利福德', '652', '六次当选俄罗斯年度人物，两度登顶《福布斯》杂志全球最具影响力人物排行榜，十多年来领导着世界国土面积最大、自然资源丰富的第二大核武器国家……弗拉基米尔普京是俄罗斯人心目中的彼得大帝、、', '红旗出版社', '0', '2017-06-14 16:34:29', '人物传记', '《普京传》', '普京传.png', '39');
INSERT INTO `book_inf` VALUES ('16', '詹姆斯', '789', 'NBA巨星勒布朗詹姆斯的自传，是詹姆斯对少年时期打球经历的回顾。', '译林出版社', '0', '2017-06-14 16:36:56', '人物传记', '《我的兄弟 我的篮球》', '我的兄弟我的篮球.png', '102');
INSERT INTO `book_inf` VALUES ('17', '王小波', '1025', '《王小波集:沉默的大多数》王小波的杂文是值得也经得住反复细读的。真正能思想的人并不多，能从思想中得到快乐者更是寥寥，王小波就是其中的一个。', '清华大学出版社', '0', '2017-06-14 16:41:33', '中国文学', '《沉默的大多数》', '沉默的大多数.png', '51');
INSERT INTO `book_inf` VALUES ('18', '余华', '156', '《活着》是一部充满血泪的小说。余华通过一位中国农民的苦难生活讲述了人如何去承受巨大的苦难；讲述了眼泪的丰富和宽广；讲述了绝望的不存在：讲述了人是为了活着本身而活着……', '作家出版社', '0', '2017-06-14 16:43:15', '中国文学', '《活着》', '活着.png', '78');
INSERT INTO `book_inf` VALUES ('19', '林徽因', '1021', '抛开那些夸张的吹捧、泛滥的溢美和捕风捉影的八卦，林徽因究竟是个怎样的女子？对林徽因的认识，总是在争议之中。冰心赞她：她很美丽，很有才气；又在《我们太太的客厅》里讽刺抨击她。喜欢她的女人，恨不能按模子复刻一份爱情事业双丰收的灿烂人生', '天津人民出版社', '0', '2017-06-14 16:44:59', '中国文学', '《你是人间四月天》', '你是人间四月天.png', '59');
INSERT INTO `book_inf` VALUES ('21', '余光中', '1045', '《孤独是生命的礼物》收录了余光中、林清玄、白先勇、刘克襄、马家辉、朱天衣等知名作家的散文作品，还可在作家笔下看见关于前辈木心、胡适、罗兰、林海音、潘人木、钟鼎文等的往事回忆。', '长江文艺出版社', '0', '2017-06-14 16:49:44', '中国文学', '《孤独是生命中的礼物》', '孤独是生命中的礼物.png', '94');
INSERT INTO `book_inf` VALUES ('22', '周国平', '956', '周国平以精神、教育、人生价值为话题，以独特的哲学角度表述并展开什么是爱、什么是智慧，突出了人获得快乐的源泉是丰富的内心世界： 一个人唯有用自己的头脑去思考，用自己的灵魂去追求，在对世界的看法和对人生的态度上自己做主，才是真正做了自己的主人。', '湖南文艺出版社', '0', '2017-06-14 16:53:21', '中国文学', '《我们都是孤独的行路人》', '我们都是孤独的行路人.png', '49');
INSERT INTO `book_inf` VALUES ('23', '柴静', '1059', '《看见》是央视知名记者、主持人柴静，首度出书讲述十年央视生涯。个人成长的告白书，中国社会十年变迁的备忘录。', '广西师范大学出版社', '0', '2017-06-14 16:55:27', '中国文学', '《看见》', '看见.png', '78');
INSERT INTO `book_inf` VALUES ('24', '龙应台', '913', '21世纪的《背影》+感人至深的“生死笔记”+龙应台亲手摄影+跨三代共读的人生之书……“有些路啊，只能一个人走……”。', '广西师范大学出版社', '0', '2017-06-14 16:57:09', '中国文学', '《目送》', '目送.png', '45');
INSERT INTO `book_inf` VALUES ('25', '帕里斯', '50', '《关上门以后》有时候，完美的爱人，就是完美的谎言。一幅重度施虐狂的画像，一部可能令你幽闭恐惧感的惊悚作品。读了之后，每当有英俊男人从身边经过，你可能都会有尖叫着跑开的冲动。\r\n每个人都认识像杰克与格蕾丝这样的完美夫妻。', '北京联合出版社', '0', '2017-06-14 17:11:04', '外国文学', '《关上门以后》', '关上门以后.png', '29');
INSERT INTO `book_inf` VALUES ('26', '柯南道尔', '99', '《福尔摩斯探案全集》包括了：《血字的研究》、《四签名》、《冒险史》（上下）、《回忆录》、《巴斯克维尔的猎犬》、《归来记》（上下）、《恐怖谷》、《鞠躬尽瘁》和《新探案》9部11册。书中有将近600幅的精美插图。', '上海社会科学院出版社有限公司', '0', '2017-06-14 17:14:02', '外国文学', '《福尔摩斯探案全集》', '福尔摩斯探案全集.png', '5');
INSERT INTO `book_inf` VALUES ('27', '村上春树', '666', '《我的职业是小说家》是村上春树前所未有的自传性作品，历时六年完成。一个人，写作三十五年，十三部长篇小说，超过五十种语言译本。虽然拥有享誉世界的知名度，但关于村上春树，许多事情始终包裹在神秘的面纱中：他是怎样下定决心走上职业小说家之路？', '南海出版公司', '0', '2017-06-14 17:15:26', '外国文学', '《我的职业是小说家》', '我的职业是小说家.png', '21.99');
INSERT INTO `book_inf` VALUES ('28', '莎士比亚', '684', '《哈姆莱特》一直以来被誉为莎士比亚的巅峰之作。这部作品叙述了丹麦王子哈姆莱特为父报仇的故事。哈姆莱特在德国读书时，他的叔父克劳狄斯毒死老哈姆莱特，篡夺了王位，并霸占了哈姆莱特的母亲。哈姆莱特回国后，决定为父报仇。结果他误杀了情人奥非利娅的父亲，奥菲利娅因此疯癫自尽。国王乘机挑拨波洛涅斯的儿子雷欧提斯以比剑为名，设计用毒剑刺死了哈姆莱特。该剧的结尾，哈姆莱特、国王、王妃、雷欧提斯同归于尽。', '青苹果数据中心', '0', '2017-06-14 17:17:44', '外国文学', '《哈姆莱特》', '哈姆莱特.png', '15');
INSERT INTO `book_inf` VALUES ('29', '川端康成', '496', '本书包括诺贝尔奖获奖作《雪国》与川端康成经典作品《湖》。故事由驶往雪国的列车开始，窗外不停掠过的暮景，映着玻璃上照出的少女的双眸，扑朔迷离。舞蹈艺术研究者岛村前后三次前往白雪皑皑的北国山村，与当地的艺伎驹子，以及萍水相逢的少女叶子，陷入爱恋纠葛，簌簌落下的雪掩盖了一切爱与徒劳……', '南海出版公司', '0', '2017-06-14 17:19:02', '外国文学', '《雪国》', '雪国.png', '19');
INSERT INTO `book_inf` VALUES ('30', '歌德', '888', '《少年维特的烦恼》从艺术特色讲并不是典型的Novelle，歌德自己和传统的德国文学史都视之为长篇即所谓Roman。只是由于其篇幅仅仅9万来字，按照我们的习惯通常称为中篇，也就收了进来。关于歌德这篇代表作的思想内容和艺术成就，各种外国文学教材中都分析、评介得很多，似无重复的必要。', '浙江文艺出版社', '0', '2017-06-14 17:20:31', '外国文学', '《少年维特的烦恼》', '少年维特的烦恼.png', '6');
INSERT INTO `book_inf` VALUES ('31', '海明威', '888', '《老人与海》是海明威于1951年在古巴写的一篇中篇小说，于1952年出版。是海明威最著名的作品之一。它围绕一位老年古巴渔夫，与一条巨大的马林鱼在离岸很远的湾流中搏斗而展开故事的讲述。它奠定了海明威在世界文学中的突出地位，这篇小说相继获得了1953年美国普利策奖和1954年诺贝尔文学奖。', '商务印书馆', '0', '2017-06-14 17:21:55', '外国文学', '《老人与海》', '老人与海.png', '9');
INSERT INTO `book_inf` VALUES ('32', '莎士比亚', '155', '《罗密欧与朱丽叶》是莎士比亚著名戏剧作品之一。罗密欧和朱丽叶是两个世仇家族的继承人，二人于舞会一见钟情后，才知道对方身份，最后二人为了在一起，朱丽叶先服假毒装死，醒来发现罗密欧却因不明真相而殉情，最终也相继自尽。故事结束在阴差阳错，令人扼腕顿足。', '青苹果数据中心', '4', '2017-06-14 17:23:14', '外国文学', '《罗密欧与朱丽叶》', '罗密欧与朱丽叶.png', '15');

-- ----------------------------
-- Table structure for `car_inf`
-- ----------------------------
DROP TABLE IF EXISTS `car_inf`;
CREATE TABLE `car_inf` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photoname` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of car_inf
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_swgk1opl0d0jsk40oy63dkmri` (`book_id`),
  CONSTRAINT `FK_swgk1opl0d0jsk40oy63dkmri` FOREIGN KEY (`book_id`) REFERENCES `book_inf` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `managerId` int(11) NOT NULL AUTO_INCREMENT,
  `managerName` varchar(255) DEFAULT NULL,
  `managerPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `orderDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `ifcomment` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderDetailId`),
  KEY `FK_n6abichot329ecijoqnmorks8` (`book_id`),
  KEY `FK_47rfwue5buamcenofjv8m1j6w` (`order_id`),
  CONSTRAINT `FK_47rfwue5buamcenofjv8m1j6w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_n6abichot329ecijoqnmorks8` FOREIGN KEY (`book_id`) REFERENCES `book_inf` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for `OrderDetail`
-- ----------------------------
DROP TABLE IF EXISTS `OrderDetail`;
CREATE TABLE `OrderDetail` (
  `orderDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `ifcomment` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderDetailId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of OrderDetail
-- ----------------------------
INSERT INTO `OrderDetail` VALUES ('1', '0', '1', '2', '4');
INSERT INTO `OrderDetail` VALUES ('2', '0', '1', '3', '4');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderEvaluation` varchar(255) DEFAULT NULL,
  `orderPrice` double NOT NULL,
  `orderState` varchar(255) DEFAULT NULL,
  `orderStateReason` varchar(255) DEFAULT NULL,
  `orderTime` varchar(255) DEFAULT NULL,
  `userAddress` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userPhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('4', null, '71', '未确认', null, '2019-08-31 19:17:23', null, '11', null, null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `registDate` datetime DEFAULT NULL,
  `useNickName` varchar(255) DEFAULT NULL,
  `userAddress` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `userPhone` varchar(255) DEFAULT NULL,
  `userPhoto` varchar(255) DEFAULT NULL,
  `userSex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2017-06-14 14:12:46', 'baobao', '地址:广东省珠海市唐家湾金凤路6号', '1685368360@qq.com', '豆浆油条0', 'c6f057b86584942e415435ffb1fa93d4', '13160675990', null, '男');
INSERT INTO `user` VALUES ('2', '2017-06-14 14:19:30', '陈晓红', '地址:广东省珠海市唐家湾金凤路6号', '1685368361@qq.com', '豆浆油条1', '698d51a19d8a121ce581499d7b701668', '13160675991', '', '女');
INSERT INTO `user` VALUES ('3', '2017-06-14 14:20:03', '谈书墨', '地址:广东省珠海市唐家湾金凤路6号', '1685368362@qq.com', '豆浆油条2', 'bcbe3365e6ac95ea2c343a2395834dd', '13160675992', '', '男');
INSERT INTO `user` VALUES ('4', '2017-06-14 14:20:19', '古梦兰', '地址:广东省珠海市唐家湾金凤路6号', '1685368363@qq.com', '豆浆油条3', '31dcbbf4cce62f762a2aaa148d556bd', '13160675993', '', '女');
INSERT INTO `user` VALUES ('5', '2017-06-14 14:20:35', '耿耿', '地址:广东省珠海市唐家湾金凤路6号', '1685368364@qq.com', '豆浆油条4', '55a141f12de6341fba65bad043350', '13160675994', '', '男');
INSERT INTO `user` VALUES ('6', '2017-06-14 14:21:00', null, null, '1685368365@qq.com', '豆浆油条5', '15de21c670ae7c3f6f3f1f372933c9', '13160675995', null, null);
INSERT INTO `user` VALUES ('7', '2017-06-14 14:21:50', null, null, '1685368366@qq.com', '豆浆油条6', 'fae0b27c451c728867a567e8c1bb4e53', '13160675996', null, null);
INSERT INTO `user` VALUES ('8', '2017-06-14 14:22:03', null, null, '1685368367@qq.com', '豆浆油条7', 'f1c159258841102af34cbaedd6fc33', '13160675997', null, null);
INSERT INTO `user` VALUES ('9', '2017-06-14 14:22:19', null, null, '1685368368@qq.com', '豆浆油条8', 'a113ef6b61820daa5611c87ed8d5ee', '13160675998', null, null);
INSERT INTO `user` VALUES ('10', '2017-06-14 14:22:50', null, null, '1685368369@qq.com', '豆浆油条9', 'b76835de79a2b4e80506f582af3676a', '13160675999', null, null);
INSERT INTO `user` VALUES ('11', '2019-08-31 19:06:44', null, null, '168536788@qq.com', 'testuser', 'e1adc3949ba59abbe56e057f2f883e', '13535559563', null, null);
