SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
set global time_zone='+8:00';

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cno` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程号',
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
  `credit` int(11) NULL DEFAULT NULL COMMENT '学分',
  `semester` int(11) NULL DEFAULT NULL COMMENT '开课学期',
  PRIMARY KEY (`cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of course
-- ----------------------------

INSERT INTO `course` VALUES ('C001', '高等数学', 4, 1);
INSERT INTO `course` VALUES ('C002', '大学英语', 3, 1);
INSERT INTO `course` VALUES ('C003', '大学英语', 3, 2);
INSERT INTO `course` VALUES ('C004', '计算机文化学', 2, 2);
INSERT INTO `course` VALUES ('C005', 'Java', 2, 3);
INSERT INTO `course` VALUES ('C006', '数据库基础', 4, 5);
INSERT INTO `course` VALUES ('C007', '数据结构', 4, 4);
INSERT INTO `course` VALUES ('C008', '计算机网络', 4, 4);

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `sno` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `cno` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程号',
  `grade` int(11) NULL DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`sno`, `cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('0811101', 'C001', 96);
INSERT INTO `sc` VALUES ('0811101', 'C002', 80);
INSERT INTO `sc` VALUES ('0811101', 'C003', 84);
INSERT INTO `sc` VALUES ('0811101', 'C005', 62);
INSERT INTO `sc` VALUES ('0811102', 'C001', 92);
INSERT INTO `sc` VALUES ('0811102', 'C002', 90);
INSERT INTO `sc` VALUES ('0811102', 'C003', 85);
INSERT INTO `sc` VALUES ('0811102', 'C004', 84);
INSERT INTO `sc` VALUES ('0811102', 'C005', 73);
INSERT INTO `sc` VALUES ('0811102', 'C006', 76);
INSERT INTO `sc` VALUES ('0811102', 'C007', NULL);
INSERT INTO `sc` VALUES ('0811103', 'C001', 50);
INSERT INTO `sc` VALUES ('0811103', 'C004', 80);
INSERT INTO `sc` VALUES ('0831101', 'C001', 50);
INSERT INTO `sc` VALUES ('0831101', 'C004', 80);
INSERT INTO `sc` VALUES ('0831102', 'C007', NULL);
INSERT INTO `sc` VALUES ('0831103', 'C004', 78);
INSERT INTO `sc` VALUES ('0831103', 'C005', 65);
INSERT INTO `sc` VALUES ('0831103', 'C007', NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sno` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `sname` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `ssex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `sage` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `dept` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在系',
   PRIMARY KEY (`sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('0811101', '李勇', '男', 21, '计算机系');
INSERT INTO `student` VALUES ('0811102', '刘晨', '男', 20, '计算机系');
INSERT INTO `student` VALUES ('0811103', '王敏', '女', 20, '计算机系');
INSERT INTO `student` VALUES ('0811104', '张小红', '女', 19, '计算机系');
INSERT INTO `student` VALUES ('0821101', '张立', '男', 20, '信息管理系');
INSERT INTO `student` VALUES ('0821102', '吴宾', '女', 19, '信息管理系');
INSERT INTO `student` VALUES ('0821103', '张海', '男', 20, '信息管理系');
INSERT INTO `student` VALUES ('0831101', '钱小平', '女', 21, '通信工程系');
INSERT INTO `student` VALUES ('0831102', '王大力', '男', 20, '通信工程系');
INSERT INTO `student` VALUES ('0831103', '张珊珊', '女', 19, '通信工程系');