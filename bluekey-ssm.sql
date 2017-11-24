/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : bluekey-ssm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-24 09:56:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `access_id` int(15) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) NOT NULL COMMENT '权限名字',
  `short_title` varchar(1000) NOT NULL COMMENT '简称',
  `function` varchar(3000) DEFAULT NULL COMMENT '功能介绍',
  `platform` varchar(1000) DEFAULT NULL COMMENT '基于平台',
  `apply_step` varchar(3000) DEFAULT NULL COMMENT '申请步骤',
  `url` varchar(1000) DEFAULT NULL COMMENT '链接',
  `other_url` varchar(1000) DEFAULT NULL COMMENT '其他链接',
  `apply_email` varchar(255) DEFAULT NULL COMMENT '发送邮件地址',
  `lead_time` varchar(255) DEFAULT NULL COMMENT '审批时间',
  `parent_part` int(10) NOT NULL COMMENT '属于哪种类型权限，1为general ,2 为function',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_operator` varchar(100) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_operator` varchar(100) DEFAULT NULL COMMENT '更新者',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of access
-- ----------------------------
INSERT INTO `access` VALUES ('1', 'PCMSwwww', 'PCMSdfdsg', 'Check or upload information (contract, price, lead time, MOQ, MPQ, etc) for procurement work usehgjf.', '1', 'Step 1: Go to \"http://uaweb.pok.ibm.com/uaweb/customers\"\r\n\r\nStep 2: Then go to \"Procurement Contract Management System + Outsourced Supply Chain\"\r\n          Click \"Procurement Contract Management System(PCMS)\" \r\n\r\nStep 3: Click \"Outsourced Supply Chain(OSC)\" \r\n\r\nStep 4: Click \"Request new ID\" \r\n\r\nStep 5: Click \"PCMS WW Buyer\"\r\n\r\nStep 6: Give clear input on why you need this  access on Additional Requirements Justification (Required).\r\n\r\nSystem sapitds@us.ibm.com will feedback User ID xxxxxxx add \r\nrequest complete with password', 'http://uaweb.pok.ibm.com/uaweb/customers', '', '', '3', '2', '2017-08-08 11:12:17', 'szrhlong@cn.ibm.com', '2017-10-18 17:48:06', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('2', 'Council server page', 'Council server', 'Check DCF information; Check DCF error; Edit Logistic codes for part numbers; Check future demand of part numbers; Check PCMS data for a whole contract, etc.', '2', 'Step 1: Send email to \"Cpm Apps Toolset/India/Contr/IBM\" for access link\r\n\r\nStep 2: Input data according to its instruction. \r\n            You can also refer to backup in the ending of the file for detail reference. \r\n\r\nStep 4: Once approval is done in system. Still need send email to \"Karen Dempsey/Endicott/IBM@IBMUS\" and copy \"Laurie Cohn/Fishkill/IBM@IBMUS\" for email approval. \r\n\r\nStep 5: Then send to \"Lorana Lo <lorana@us.ibm.com>\", Cc \"Ron Cafarelli v2ron@us.ibm.com\". Later Lorana will provide ID & Password and link to you.', 'http://ntsrvalmb.fishkill.ibm.com:8080/www/cgi-bin/homepage/council_server_home_page.pl', '', 'ctoolset@in.ibm.com', '10', '2', '2017-08-08 11:20:28', 'szrhlong@cn.ibm.com', '2017-10-30 17:29:16', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('3', 'Platform Procurement Quote Room', 'Platform Procurement Quote Room', 'Backup contract changes after loading PCMS; Check PCMS-updating history.  ', '1', 'Step 1: Send notes to \"Susan Titus/Rochester/IBM@IBMUS\"\r\n\r\nStep 2: She will send you database notes link.\r\n            Click the notes link then you enter the Quote room.', '', '', 'stitus1@us.ibm.com', '3', '2', '2017-08-08 11:24:12', 'szrhlong@cn.ibm.com', '2017-09-07 11:55:32', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('4', 'Global Supplier Diversity room', 'Supplier Diversity Room', 'Upload and backup spending on diversity suppliers', '1', 'Step 1: Send notes to \"Johnny Elias/San Jose/IBM\"\r\n\r\nStep 2: She will send you database notes link.\r\n            Click the notes link then you enter the Diversity Room.', '', '', 'jelias@us.ibm.com', '3', '2', '2017-08-08 11:27:23', 'szrhlong@cn.ibm.com', '2017-08-28 20:47:16', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('5', 'Procurement Operation', 'Procurement Operation', 'Upload and backup spending on diversity suppliers', '1', 'Step 1: Send notes to \"Susan Titus/Rochester/IBM@IBMUS\"\r\n\r\nStep 2: She will send you database notes link.\r\n           Click the notes link then you enter the Procurement Operation.', '', '', 'stitus1@us.ibm.com', '3', '2', '2017-08-08 11:30:31', 'szrhlong@cn.ibm.com', '2017-10-18 18:06:17', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('6', 'GSA Access', 'GSA', 'enable Blue Prism automation', '1', 'Step 1: Go to: https://w3-03.ibm.com/tools/daat/\r\n\r\nStep 2: Login with Intranet ID & PSW  \r\n            Choose \"New IDs\" \r\n            Click \"Continue\"\r\n\r\nStep 3: Select \"GSA\"  \r\n            Click \"Continue\" \r\n            Set your own GSA ID\r\n            Click \"Submit\"                                        \r\n\r\nStep 4: Then recive email from gsacron with GSA ID and PSW                                                          \r\n            You can get help at: http://bejgsa.ibm.com/gsadoc/help/reg_daat.shtml#create\r\n\r\nIMPORTANT: GSA IDs must confirm to the following rules:\r\n1. The GSA ID must be between 3 and 8 characters in length\r\n2. The first character must be a lowercase letter (a-z)\r\n3. The remaining characters must be lower case letters or numbers', 'https://w3-03.ibm.com/tools/daat/', '', '', '3', '2', '2017-08-08 11:33:28', 'szrhlong@cn.ibm.com', '2017-09-07 11:13:58', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('7', 'Emptoris', 'Emptoris', 'Source File and Fair Value', '2', 'Step 1: Go to Link: http://w3-03.ibm.com/procurement/sourcing/\r\n\r\nStep 2: Find a link named \"register to use Emptoris now\" in the article\r\n             Then Click the link\r\n\r\nStep 3: Click \"Internal IBM Emptoris for Procurement Users\"\r\n\r\nStep 4: Click \"Request Access\" \r\n            Then Input Intranet Email Address\r\n\r\nStep 5: Continue\r\n\r\nStep 6: Are you in US: \"NO\"\r\n\r\nStep 7: Select the role: \"Buyer\"\r\n             After choose Buyer, select \"Site Maintenance\" in Commodity Family\r\n             Click \"Submit\" \r\n\r\nStep 9: Wait for Manager\'s Approval', 'http://w3-03.ibm.com/procurement/sourcing/', '', '', '3', '2', '2017-08-08 11:35:49', 'szrhlong@cn.ibm.com', '2017-08-28 21:00:23', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('8', 'Cost Tape', 'Cost Tape', 'Check the history of prices of a part (upload by procurement specialist)', '1', 'Step 1: Go to: \"http://boca2.lexington.ibm.com/autoid/AccessRequest\" to apply. \r\n\r\nStep 2: Choose \"Cost tape-IBM\" \r\n\r\nStep : Choose \"China CN03\"\r\n\r\nStep : Input \"A+5 serial number\" (i.e. A12345) \r\n\r\nStep : Choose your ID\r\n\r\nStep : GCM Part Owner choose \"add access\"\r\n\r\nStep : System will send email to manager for approval \r\n          You can refer to backup in the ending of the file for detail reference', 'http://boca2.lexington.ibm.com/autoid/AccessRequest', '', '', '3', '2', '2017-08-08 11:37:02', 'szrhlong@cn.ibm.com', '2017-09-07 13:47:24', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('9', 'Cost Opportunities database', 'Cost Opportunities database', 'check or upload cost saving opportunities, Finance team will follow and monitor the result', '1', 'Step 1: Go to Link: \"http://boca2.lexington.ibm.com/autoid/AccessRequest\"\r\n\r\nStep 2: In system: Choose \"Cost Opportunity Database\"\r\n\r\nStep 3: Country: \"China-CN3\"\r\n            Serial Number: \"12345\"\r\n             Next\r\n\r\nStep 4: User ID: choose \"New, please enter\" (i.e. ABCD/China/IBM)\r\n            Action: choose \"Add, Change or View\"\r\n            Next\r\n\r\nStep 5: Choose \"Add\" in Requested Action for all Group Descriptions\r\n            Next\r\n\r\nStep 6: Input Justification for all Group Descriptions\r\n            When finish input, click \"Next\"\r\n\r\nStep 7: Click \"Next\"\r\n\r\nStep 8: Request will be submitted.\r\n\r\nStep 9: Receive notes link in your Notes Email.\r\n            Click the link then you enter the COD.', 'http://boca2.lexington.ibm.com/autoid/AccessRequest', '', '', '3', '2', '2017-08-08 11:39:10', 'szrhlong@cn.ibm.com', '2017-08-28 21:42:10', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('10', 'Tracker Team Room', 'Tracker', 'Check the projected and actual prices and volumes of procurement parts. Data can be sorted by month or by quarter. ', '1', 'Step 1: Send notes to “Michelle Cook/Rochester/Contr/IBM” or “Andre Woody/Raleigh/IBM@IBMUS” \r\n\r\nStep 2: They will feedback you the database link\r\n\r\nStep 3: Click the link then you enter the Tracker', '', '', 'xzw0997@us.ibm.com', '3', '2', '2017-08-08 11:47:59', 'szrhlong@cn.ibm.com', '2017-08-29 13:58:45', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('11', 'Mirror', 'Mirror', 'Through the MirrorMart, we can check the BOM information of a part. The information of the part include part name, release dates, production status, part description, etc.', '2', 'Step 1: Go to website: \"http://sailw3.pok.ibm.com/enovia/UserAccessMM.htm\"\r\n\r\nStep 2: Click the link \"ENOVIA Userid Request Form\"\r\n\r\nStep 3: Click \"Request Access\"\r\n\r\nStep 4: Follow the instruction to fill the form.\r\n\r\nStep 5: Submit\r\n\r\nStep 6: Log in to Mirror Mart using Intranet ID & PSW', 'http://sailw3.pok.ibm.com/enovia/UserAccessMM.htm', '', '', '3', '2', '2017-08-08 11:48:59', 'szrhlong@cn.ibm.com', '2017-08-29 11:11:55', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('12', 'SMU Author', 'SMU', 'Input information before create a contract', '2', 'Step 1: Go to: \"http://uaweb.pok.ibm.com/bondweb/customers\"\r\n\r\nStep 2: Choose \"Supplier Management Utility\" \r\n\r\nStep 3: Click \"Request Access\"\r\n\r\nStep 4: Enter Intranet Email\r\n\r\nStep 5: In System Access Information\r\n            Choose \"SMU Author\" for Role Code\r\n            Choose \"IBM\" for Corporate ID\r\n\r\nStep 6: Input Business Justification.\r\n\r\nStep 7: System will send email to manager for approval\r\n\r\nStep 8: System will send you the link, then click and use your intranet ID to login', 'http://uaweb.pok.ibm.com/bondweb/customers', '', '', '1', '2', '2017-08-08 11:50:10', 'szrhlong@cn.ibm.com', '2017-08-29 11:19:32', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('13', 'Telephone long distant password', 'Telephone', 'Geeting access to use the telephone in office', '2', 'Step 1: Apply on ITSM/telephone request\r\n\r\nStep 2: Choose long distant password. \r\n\r\nIn urgent case, call IT Guoping Wan \r\nExt: 2183 to speed up the process', 'https://w3.ibm.com/onesearch/#/search?query=IT%20Service%20Management', 'https://w3.ibm.com/onesearch/#/search?query=IT%20Service%20Management', 'Bruce@cn.ibm.com', '7', '1', '2017-08-08 12:05:20', 'szrhlong@cn.ibm.com', '2017-09-07 11:49:13', 'brucel@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('14', 'AT&T & VPN (MTS ID)', 'VPN', 'Connect to internet then work from home.', '2', 'Step 1: Go to Link: https://w3.ibm.com/help/#/browse/software_and_hardware/category/connectivity\r\n\r\nStep 2: Click \"Install the AT&T Network Client \"  \r\n\r\nStep 3: Navigate to the IBM Standard Software Installer (ISSI) website  \r\n\r\nStep 4: If prompted with \"Welcome to the IBM Software Catalog,\" select your location  \r\n\r\nStep 5: Click \"Continue\"  \r\n\r\nStep 6: Search for the AT&T Client (last version)  \r\n\r\nStep 7: Install the required software', 'https://w3.ibm.com/help/#/browse/software_and_hardware/category/connectivity', '', '', '3', '1', '2017-08-08 12:06:52', 'szrhlong@cn.ibm.com', '2017-09-07 11:56:01', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('15', 'WIFI for computer', 'WIFI', 'Connect internet without Ether Line in office.', '2', 'Step 1: Go to Link: https://w3.ibm.com/help/#/article/install_digicert/install_overview  =>  \r\n\r\nStep 2: Click \"I am ready to set up access\"\r\n\r\nStep 3: Navigate to \"IBM Internal Certificate Authority website\"\r\n\r\nStep 4: Login with your intranet ID and password\r\n\r\nStep 5: Provide a description of your computer and a password for the certificate\r\n\r\nStep 6: Click \"Confirm\"\r\n\r\nStep 7: Click Request Certificate\r\n\r\nStep 8: Receive approval code by email from IBMCAPKI Administrator\r\n\r\nStep 9: Enter your approval code\r\n\r\nStep 10: Select \"Run\" at the \"Do you want to run this application?\" prompt', 'https://w3.ibm.com/help/#/article/install_digicert/install_overview', '', '', '3', '1', '2017-08-08 12:07:53', 'szrhlong@cn.ibm.com', '2017-09-07 13:58:08', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('16', 'Emptoris for BC use', 'Emptoris BC', 'Conducts Sourcing events, Creates Contracts, Invites Supplier to register in Emptoris, Creates Source File documentation', '2', 'Step 1: Go to: \"http://w3-03.ibm.com/procurement/sourcing/\"  \r\n\r\nStep 2: Click the link \"register\"  \r\n\r\nStep 3: Choose \"Internal IBM Emptoris for Procurement Users\" in Application \r\n\r\nStep 4: Click \"Request Access\"\r\n\r\nStep 5: Choose \"NO\" in US Federal Procurement\r\n\r\nStep 6: Choose \"Buyer\" in Role\r\n\r\nStep 7: Choose your Organization Code (i.e. DD06 Mech)\r\n\r\nStep 8: Input Justification\r\n\r\nStep 9: Submit', 'http://w3-03.ibm.com/procurement/sourcing/', '', '', '3', '1', '2017-08-08 14:18:28', 'szrhlong@cn.ibm.com', '2017-08-29 11:39:27', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('17', 'Council Server Home Page', 'Council Server BC', 'Report generation/Testing', '2', 'Step 1: Send email to the admin \"Cpm Apps Toolset\"\r\n\r\nStep 2: Follow his instruction and provide required information.\r\n\r\nStep 3: When the application is confirmed, you receive the ID & PSW\r\n\r\nStep 4: Log in to the Council Server', '', '', 'ctoolset@in.ibm.com', '3', '1', '2017-08-08 18:14:01', 'szrhlong@cn.ibm.com', '2017-08-29 11:42:23', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('18', 'CPE ', 'CPE', 'Reporting BC daily work', '2', 'Step 1: Go to: \"http://pokziscsrv80.pok.ibm.com/webform/Login.do\" \r\n\r\nStep 2: Log in using \"Intranet ID & PSW\"', 'http://pokziscsrv80.pok.ibm.com/webform/Login.do', '', '', '1', '1', '2017-08-08 23:06:54', 'szrhlong@cn.ibm.com', '2017-10-18 17:50:38', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('19', 'Tracker', 'Tracker BC', 'Check the projected and actual prices and volumes of procurement parts. Data can be sorted by month or by quarter. ', '2', 'Step 1: Send email to \"Michelle Cook/Rochester/Contr/IBM@IBMUS\"\r\n\r\nStep 2: Provide him required information\r\n\r\nStep 3: Receive notes link of Tracker, then click to enter.', '', '', 'xzw0997@us.ibm.com', '3', '2', '2017-08-08 23:10:46', 'szrhlong@cn.ibm.com', '2017-08-29 13:58:56', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('20', 'Procurement Business Control Team Room', 'Procurement Business Control', 'Check the SOX and Non-SOX testing results', '1', 'Step 1: Send email to \"Chang Yu Yang\" requesting for access.\r\n\r\nStep 2: Provide required information by email.', '', '', 'yangcy@cn.ibm.com', '3', '2', '2017-08-08 23:13:53', 'szrhlong@cn.ibm.com', '2017-08-29 14:05:01', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('21', 'Procurement Business Control Support DB', 'Procurement BC Support DB', 'Loading Report result', '1', 'Step 1: Send email to \"Patti Richardson/Charlotte/IBM\"\r\n\r\nStep 2: Provide required information by email.\r\n\r\nStep 3: Receive confirmed access from Admin.', '', '', 'plr@us.ibm.com', '3', '2', '2017-08-08 23:17:12', 'szrhlong@cn.ibm.com', '2017-08-29 14:07:39', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('22', 'TG Team Room', 'TG', 'Loading ZMR Report', '1', 'Step 1: Send notes to “James Meredith/Burlington/IBM\"\r\n\r\nStep 2: They will feedback you the database link\r\n            \r\nStep 3: Click the link then you enter the TG Team Room', '', '', 'xxx@us.ibm.com', '3', '2', '2017-08-08 23:20:40', 'szrhlong@cn.ibm.com', '2017-11-15 14:02:38', 'brucel@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('23', 'EP123233226666', 'EP1234234236666', 'The access of EP1 is used for running data of GP011,GP002 report,creating ZMR report and sending out,which is necessary for business control team\'s daily work.Above is the Requirements Justification.', '2', 'Step 1: Go to: \"http://uaweb.pok.ibm.com/uaweb/systems?customer=imd\"\r\n\r\nStep 2: Click \"Microelectronics Division\"         \r\n\r\nStep 3: Click \"EP1-WWAP\"\r\n\r\nStep 4: Click \"Request for new ID\"\r\n\r\nStep 5: Follow instruction and provide information\r\n\r\nStep 6: Log in the website with Intranet ID & PSW', 'http://uaweb.pok.ibm.com/uaweb/systems?customer=imd', '', '', '3', '2', '2017-08-08 23:21:49', 'szrhlong@cn.ibm.com', '2017-11-15 14:07:41', 'brucel@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('24', 'GP1  ', 'GP1  ', 'The access of GP1is used for running data of GP011,GP002 report,creating ZMR report and sending out,which is necessary for business control team\'s daily work.Above is the Requirements Justification.', '2', 'Step 1: Go to: \"http://uaweb.pok.ibm.com/uaweb/systems?customer=imd\"\r\n\r\nStep 2: Click \"Worldwide Procurement\"         \r\n\r\nStep 3: Click \"WWP Production - GP1\"\r\n\r\nStep 4: Click \"Request for new ID\"\r\n\r\nStep 5: Follow instruction and provide information\r\n\r\nStep 6: Log in the website with Intranet ID & PSW', 'http://uaweb.pok.ibm.com/uaweb/systems?customer=imd', '', '', '3', '2', '2017-08-08 23:22:52', 'szrhlong@cn.ibm.com', '2017-10-31 11:43:37', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('25', 'OMCSQQQQQQ', 'OMCS', 'Order Management Component Services (OMCS) is an IBM order milestone processing and routing system for worldwide manufacturing plants.  The user interface will allow an end user to:  Search for orders, display/update order details and create new orders Submit milestones View and maintain support tables Search and view the activity log for results of processing Search and view unprocessed requests due to errors Recreate interfaces Set User preferences', '2', 'Step 1: Go to: \"http://uaweb.pok.ibm.com/uaweb/systems?customer=imd\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'https://w3-01.ibm.com/isc/tools/mfg/omcs/workbench/omcs.wss/login', '', '', '3', '2', '2017-08-08 23:28:46', 'szrhlong@cn.ibm.com', '2017-10-31 13:50:57', 'brucel@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('26', 'MFSSSSSSSS', 'MFSSSSSSSSSSSS', 'view and check', '2', 'Step 1: Go to: \"http://rchasa05.rchland.ibm.com/pwd/input?userid=SABRINAZ\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://rchasa05.rchland.ibm.com/pwd/input?userid=SABRINAZ', '', '', '3', '2', '2017-08-08 23:29:46', 'szrhlong@cn.ibm.com', '2017-11-15 14:04:49', 'brucel@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('27', 'Qry id', 'Qry id', 'view and check', '2', 'Step 1: Go to: \"http://rchasa05.rchland.ibm.com/pwd/input?userid=SABRINAZ\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://rchasa05.rchland.ibm.com/pwd/input?userid=SABRINAZ', '', '', '3', '2', '2017-08-08 23:30:52', 'szrhlong@cn.ibm.com', '2017-08-29 16:26:14', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('28', 'CST', 'CST', 'view and check', '2', 'Step 1: Go to: \"https://cnfgsvcs.rchland.ibm.com/protected/ConfigServicesProd/Manufacturing/Products/\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'https://cnfgsvcs.rchland.ibm.com/protected/ConfigServicesProd/Manufacturing/Products/', '', '', '3', '2', '2017-08-08 23:32:38', 'szrhlong@cn.ibm.com', '2017-08-29 16:26:44', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('29', 'Econfig', 'Econfig', 'The IBM Configurator for e-business (e-config) is a PC-based hardware, software, and services configurator for: IBM Storage Systems IBM POWER Systems IBM z Systems It enables you to configure multiple product lines, view all of your selections from a main view, verify product availability, view the system diagram, and price the system.', '2', 'Step 1: Go to: \"http://w3-03.ibm.com/transform/worksmart/docs/e-config.html\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://w3-03.ibm.com/transform/worksmart/docs/e-config.html', '', '', '3', '2', '2017-08-08 23:33:29', 'szrhlong@cn.ibm.com', '2017-08-30 16:23:25', 'cindyx@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('30', 'NEWC/MFC', 'NEWC/MFC', 'view and check', '2', 'Step 1: Go to: \"https://luci.ibm.com/index.php?controller=Main&action=login\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'https://luci.ibm.com/index.php?controller=Main&action=login', '', '', '3', '2', '2017-08-08 23:34:04', 'szrhlong@cn.ibm.com', '2017-08-29 16:28:31', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('31', 'PDO', 'PDO', 'view and check', '2', 'Step 1: Go to: \"https://luci.ibm.com/index.php?controller=Main&action=login\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'https://luci.ibm.com/index.php?controller=Main&action=login', '', '', '3', '2', '2017-08-08 23:34:44', 'szrhlong@cn.ibm.com', '2017-08-29 16:29:04', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('32', 'Efm ', 'Efm ', 'view and check', '2', 'Step 1: Go to: \"https://w3-01.ibm.com/tools/featurematrix/jsp/login.jsp\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'https://w3-01.ibm.com/tools/featurematrix/jsp/login.jsp', '', '', '3', '2', '2017-08-08 23:36:07', 'szrhlong@cn.ibm.com', '2017-08-29 16:29:30', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('33', 'QMF', 'QMF', 'view and check', '2', 'Step 1: Go to: \"https://w3-01.ibm.com/isc/tools/mfg/omcs/workbench/omcs.wss/login\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'https://w3-01.ibm.com/isc/tools/mfg/omcs/workbench/omcs.wss/login', '', '', '3', '2', '2017-08-08 23:37:31', 'szrhlong@cn.ibm.com', '2017-08-29 16:30:12', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('34', 'AFS', 'AFS', 'view and check', '2', 'Step 1: Go to: \"https://luci.ibm.com/index.php?controller=Main&action=login#\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'https://luci.ibm.com/index.php?controller=Main&action=login#', '', '', '3', '2', '2017-08-08 23:38:14', 'szrhlong@cn.ibm.com', '2017-08-29 16:30:54', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('35', 'Product Lifecycle Mgt', 'Product Lifecycle Mgt', ' PLM is a collection of integrated solutions that track all the electronic information associated with a product throughout its lifecycle. It focuses on the business and operational processes, as well as data and IT solutions that lie at the interface between PLM and Integrated Supply Chain Management. Consistent, reliable, high-quality PLM practices are critical to ensure that hardware solutions are synchronized with business objectives and operational requirements of the supply chain. This requires that initial development and design changes are executed according to the impact on the supply chain and that supply chain issues that effect product function and composition are proactively addressed.', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/', '', '', '3', '2', '2017-08-08 23:41:50', 'szrhlong@cn.ibm.com', '2017-08-30 16:33:59', 'cindyx@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('36', 'CATIA', 'CATIA', '3D modeling and 2D drafting', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/catiav5/index.shtml\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/catiav5/index.shtml', '', '', '3', '2', '2017-08-08 23:42:32', 'szrhlong@cn.ibm.com', '2017-08-29 16:32:26', 'szrhlong@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('37', 'ERE', 'ERE', 'ERE (Enterprise Repository Environment) is the graphical data repository for IBM Worldwide. This is the repository for technical data in IBM. This repository for document storage and retrieval facilitates the integrated data flow among design, parts selection, and product data management applications. ERE standards for data format facilitate technical data interchange across IBM and with external Suppliers. ERE contains over 3 million technical documents associated with over 1.5 million Part numbers.  Access to this information is controlled and provided to 3,500 IBM employees and 1,300 external business partners from 400 companies.', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/ere/index.shtml\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/ere/index.shtml', '', '', '3', '2', '2017-08-08 23:43:15', 'szrhlong@cn.ibm.com', '2017-08-30 16:46:50', 'cindyx@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('38', '3DPDFMaker', '3DPDFMaker', 'The 3DPDFMaker service converts 3D computer-aided design (CAD) files to Portable Document Format (PDF) files which can be reviewed, analyzed and annotated by non-CAD users using Adobe Reader. Additionally, the service processes PDF files of engineering drawings to enable annotation and analysis of 2D geometry. In February 2009, the service was extended to convert native CATIA V4, CATIA V5, Pro/E and SolidWorks files to STEP. In Sept 2014, the the service was extended to convert SolidWorks Assemblies to STEP and PDF', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/3dpdf/index.shtml\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/3dpdf/index.shtml', '', '', '0', '2', '2017-08-08 23:43:56', 'szrhlong@cn.ibm.com', '2017-08-30 16:47:29', 'cindyx@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('39', 'ENOVIA', 'ENOVIA', 'ENOVIA is a software application that can be used to create and manage product data and business processes across the life-cycle of products. In the marketplace ENOVIA is known as a Product Lifecycle Management (PLM) application. You may have heard of Product Data Management (PDM) which was an earlier generation of software applications that are limited to foundational data management such as: Item and BOM definition, document management, and Engineering Change management. PLM goes beyond PDM by covering a wide-range of data types and business processes. IBM is implementing ENOVIA in phases, and began with Item and BOM definition and Engineering Change management. This first step replaced ProductManager with ENOVIA. The second step addressed Product Material management and Environmental Compliance and replaced EMARS with Enovia\'s Materials Compliance Central. Because ENOVIA is a PLM system, ENOVIA provides many enhancements over ProductManager and EMARS. PLM are continuing our implementation of additional business processes using ENOVIA thereby continuing with centralizing data management and enhancing business processes. The next step is to support Parts Classification, and Supplier/Technology Qualification. This step would converge into ENOVIA those processes that are supported by i2 Explore. Opportunities for using ENOVIA to support business processes will be assessed based on business justification.', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/enovia/index.shtml\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/enovia/index.shtml', '', '', '3', '2', '2017-08-08 23:44:41', 'szrhlong@cn.ibm.com', '2017-08-30 16:48:40', 'cindyx@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('40', 'eXplore', 'eXplore', 'eXplore Component Information System is an enterprise wide client/server information system that links design, procurement and manufacturing for design reuse, worldwide volume consolidation and commodity management. It promotes preferred parts and enables the rapid selection of components, suppliers, and reusable design elements for dramatic reductions in time to market, product and development costs. The purpose of eXplore is to support the various IPD (Integrated Product Development) processes including Common Building Blocks and Common Part Usage, Customs Classification, VPD (Vital Product Data), Interplant Sourcing, A-Source, and 11S Barcoding. eXplore describes assemblies, building blocks and components. PM will define assemblies, building blocks and components with EC control to feed MRP. Interfaces exists between eXplore and many corporate applications, such as A-Source, Corporate Product Manager, ERE, BOM Assist and in applications specific to the CPM and PSG organizations. The eXplore API allows a rich integration scheme that is very flexible. eXplore is used to classify parts, then feeds Procurement Management Systems. The eXplore human interface is a vast improvement over legacy systems, with user exits allowing exporting and further operations on data. All divisions populate part parametric data in eXplore in support of the IPD processes. The Part Approval Process uses eXplore via BRS (BOM Review System), and interfaces to the Procurement Management Systems. CPM and PSG both use this tool suite.', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/explore/index.shtml\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/explore/index.shtml', '', '', '3', '2', '2017-08-08 23:45:18', 'szrhlong@cn.ibm.com', '2017-08-30 16:49:56', 'cindyx@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('41', 'EGINet', 'EGINet', 'EGI (Electronic Graphic Interchange) Net is an application that allows secure and traceable transactions of IBM technical information (design data, specifications, bills of material, and corporate standards) between registered suppliers and IBM using a web interface. ', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/egi/index.shtml\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/egi/index.shtml', '', '', '3', '2', '2017-08-08 23:54:37', 'szrhlong@cn.ibm.com', '2017-08-30 16:51:32', 'cindyx@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('42', 'BOMAssist', 'BOMAssist', 'BOM ASSIST is a client-accessed, java application which provides Quick Check and AVL functions on a parts list, (e.g., Cadence output)', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/enterprisebomassist/index.shtml\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/enterprisebomassist/index.shtml', '', '', '3', '2', '2017-08-08 23:55:15', 'szrhlong@cn.ibm.com', '2017-08-30 17:00:58', 'cindyx@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('43', 'CRS', 'CRS', 'CRS is an intranet web application hosted within a GWA Environment that complies with IBM Corporate Standards, along with IBM\'s requirement for reliability, security, and performance. A tool used by Supply Chain Engineering for reviewing individual parts on Bill of Material and assigning new part numbers when required.', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/crs/index.shtml\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/crs/index.shtml', '', '', '3', '2', '2017-08-08 23:55:49', 'szrhlong@cn.ibm.com', '2017-11-15 14:02:15', 'brucel@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('44', 'SQMS II', 'SQMS II', 'The Supplier Quality Management System II (SQMS II) is a collaborative Supplier/OEM/IBM tool to collect, measure, and manage quality data and metrics for purchased commodities. SQMS II collects part failure data from suppliers, OEMs, IBM manufacturing and customer claims. Reports combined with chart generation minimizes the manual effort in summarizing the data. The use of the Internet allows the supplier to directly see their product\'s performance inside IBM, and the trend charts and reports that SQMS generates. The use of this across multiple divisions and commodities in IBM results in more consistent requirements to suppliers and IBM manufacturing sites, as well as a standard data summary tool for quality groups in IBM. Flexible data input formats, multiple target sets, and supplemental data attachments enhance the tool to serve as the cornerstone in any commodity quality system. New to SQMS II in 2004 is the support of field part failure information for PCD and ESG (z Series and high-end p sSeries). Data is directly loaded into SQMS II from customer claim systems on a scheduled basis. This data is for internal IBM viewing only.', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/sqmsii/index.shtml\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/sqmsii/index.shtml', '', '', '3', '2', '2017-08-08 23:56:37', 'szrhlong@cn.ibm.com', '2017-10-31 11:41:37', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('45', 'QPEX', 'QPEX', 'QPEX is a web based application used by Design Partners to: Search IBM’s component part information for approved and preferred parts during the design. Submit BOMs to the Commodity Review Solution(CRS) Receive feedback and collaborate with ISC Engineering on BOM/Component selection. Design Partners must be approved by IBM ISC QPEX Administration to use the QPEX Application.', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/qpex/index.shtml\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/qpex/index.shtml', '', '', '3', '2', '2017-08-08 23:57:17', 'szrhlong@cn.ibm.com', '2017-11-15 14:01:52', 'brucel@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('46', 'Supplier Problem Log !111111111222', 'Supplier Problem Log1111112222', 'SPL (Supplier Problem Log) is a central repository used to track commodity issues.', '2', 'Step 1: Send email to \"Feng Xue/Singapore/IBM\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with confirmed ID & PSW', 'http://w3.ibm.com/procurement/esi', '', 'xuef@sg.ibm.com', '3', '2', '2017-08-09 00:02:11', 'szrhlong@cn.ibm.com', '2017-11-15 14:06:54', 'brucel@cn.ibm.com', '0');
INSERT INTO `access` VALUES ('47', 'Quality Information Network', 'Quality Information Network', 'QIN (Quality Information Network) is a centralized repository for supplier audit data.', '2', 'Step 1: Send email to \"Feng Xue/Singapore/IBM\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://w3.ibm.com/procurement/esi', '', 'xuef@sg.ibm.com', '3', '2', '2017-08-09 00:03:56', 'szrhlong@cn.ibm.com', '2017-10-31 15:29:14', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('48', 'Technology Qualification Application', 'Technology Qualification Application', 'TQA (Technology Qualification Application) documents the process steps used to complete end-to-end commodity qualification activities. ', '2', 'Step 1: Send email to \"Feng Xue/Singapore/IBM\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with confirmed ID & PSW', 'http://w3.ibm.com/procurement/esi', '', 'xuef@sg.ibm.com', '3', '2', '2017-08-09 00:05:21', 'szrhlong@cn.ibm.com', '2017-10-31 11:43:04', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('49', 'Supplier Quality Management System', 'Supplier Quality Management System', 'SQMS (Supplier Quality Management System) is a collaborative Supplier/IBM tool to manage issues within Production Procurement.', '2', 'Step 1: Send email to \"Feng Xue/Singapore/IBM\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with confirmed ID & PSW', 'http://w3.ibm.com/procurement/esi', '', 'xuef@sg.ibm.com', '3', '2', '2017-08-09 00:06:14', 'szrhlong@cn.ibm.com', '2017-10-31 11:41:46', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('50', 'Process Change Notification', 'Process Change Notification', 'PCN (Product/Process Change Notices) tracks the progress of PCN\'s from suppliers from initial review through closure.', '2', 'Step 1: Send email to \"Feng Xue/Singapore/IBM\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with confirmed ID & PSW', 'http://w3.ibm.com/procurement/esi', '', 'xuef@sg.ibm.com', '3', '2', '2017-08-09 00:07:27', 'szrhlong@cn.ibm.com', '2017-10-31 11:40:50', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('51', 'Off-Spec Database', 'Off-Spec Database', 'The off-spec database is used to track deviation approvals.  This may be for material substitutions, out of tolerance dimensions, assembly method deviations, etc.', '2', 'Step 1: Go to: \"http://w3.ibm.com/procurement/esi\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://w3.ibm.com/procurement/esi', '', '', '3', '2', '2017-08-09 00:12:08', 'szrhlong@cn.ibm.com', '2017-10-31 11:39:44', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('52', 'Product Manger', 'Product Manager', 'Part/assembly information.  EC release Management', '2', 'Contact Joyce Ford in Austin for help getting set up with access.\r\n\r\nStep 1: Send notes to Joyce Ford\r\n\r\nStep 2: Provide required information to the Admin.            \r\n\r\nStep 3: Log in the website with Intranet ID & PSW', '', '', 'xxx@us.ibm.com', '3', '2', '2017-08-09 00:15:44', 'szrhlong@cn.ibm.com', '2017-10-31 11:39:20', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('53', 'ERE', 'ERE', 'ERE (Enterprise Repository Environment) Print/Spec Information', '2', 'Step 1:  Go to: \"http://sailw3.pok.ibm.com/ere/index.shtml\"\r\n\r\nStep 2: Click \"Request for access\"\r\n\r\nStep 3: Input information following instruction\r\n\r\nStep 4: Receive access confirmation from system by email      \r\n\r\nStep 5: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/ere/index.shtml', '', '', '3', '2', '2017-08-09 00:16:44', 'szrhlong@cn.ibm.com', '2017-10-31 11:39:10', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('54', 'Stop Ship Database', 'Stop Ship', 'Used for tracking Open stop ships', '2', 'Step 1: Send notes to \"Linda Thompson/Rochester/IBMUS\"\r\n\r\nStep 2: Provide required information to the Admin.            \r\n\r\nStep 3: Log in the website with Intranet ID & PSW', '', '', 'lct@us.ibm.com', '3', '2', '2017-08-09 00:19:09', 'szrhlong@cn.ibm.com', '2017-10-18 17:50:49', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('55', 'EPLA Database', 'EPLA', 'Used to track eAmt records that have been added to EPLA supplements', '2', 'Requests should be sent to Glen Melmer/Rochester/IBMUS', '', '', 'melmer@us.ibm.com', '3', '2', '2017-08-09 00:21:19', 'szrhlong@cn.ibm.com', '2017-10-31 11:35:40', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('56', 'eXplore', 'eXplore', 'PN/SN Information Cross divisional', '2', 'Step 1: Go to: \"http://sailw3.pok.ibm.com/explore/index.html\"\r\n\r\nStep 2: Provide required information to the Admin.      \r\n\r\nStep 3: Receive access confirmation from system by email      \r\n\r\nStep 4: Log in the website with Intranet ID & PSW', 'http://sailw3.pok.ibm.com/explore/index.html', '', '', '3', '2', '2017-08-09 00:22:08', 'szrhlong@cn.ibm.com', '2017-10-19 10:04:12', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('57', 'WIFi for work', 'WIFi for work', 'WIFi for work ', '2', 'WIFi for work', '', '', 'wlangsz@cn.ibm.com', '3', '1', '2017-08-15 18:51:42', 'brucel@cn.ibm.com', '2017-10-18 17:50:44', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('58', 'AT&T for work', 'AT&T for work', 'AT&T for work', '1', 'AT&T for work at home', '', '', 'brucel@cn.ibm.com', '5', '1', '2017-08-15 19:00:51', 'brucel@cn.ibm.com', '2017-10-18 17:46:14', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('59', 'general access test test', 'access test', 'test access  description', '1', '1. test\r\n2. test\r\n3. test', 'http://w3-workplace.ibm.com/news/w3news/top_stories/2017/08/chq-hurricane-harvey.html', '', 'brucel@cn.ibm.com', '5', '1', '2017-08-29 18:08:26', 'nicoleh@cn.ibm.com', '2017-09-13 13:56:07', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('60', 'dsfadasfadsfasdf', 'dsfadasfadsfasdf', 'dsfadasfadsfasdf', '1', 'dsfadasfadsfasdfdsfadasfadsfasdfdsfadasfadsfasdfdsfadasfadsfasdfdsfadasfadsfasdf', '', '', '', '', '1', '2017-10-18 10:58:13', 'brucel@cn.ibm.com', '2017-10-18 17:45:03', 'brucel@cn.ibm.com', '1');
INSERT INTO `access` VALUES ('61', 'general access fdgsdggdfsg', 'dsfdsagdsfsdgfd', 'dsfdsagds', '1', 'dsfdsagdsdsfdsagdsdsfdsagds', '', '', '', '', '1', '2017-10-23 14:23:55', 'brucel@cn.ibm.com', '2017-10-23 14:26:13', 'brucel@cn.ibm.com', '1');

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `auth_role_id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'role 名字',
  `organization_right` varchar(255) DEFAULT NULL COMMENT 'orgnization权限列表',
  `role_right` varchar(255) DEFAULT NULL COMMENT 'role权限列表',
  `access_right` varchar(255) DEFAULT NULL COMMENT 'access权限列表',
  `auth_right` varchar(255) DEFAULT NULL COMMENT 'authority 权限列表',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_operator` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_operator` varchar(255) DEFAULT NULL COMMENT '更新者',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  `BU` int(15) DEFAULT NULL COMMENT 'BU 名字',
  `function` int(15) DEFAULT NULL COMMENT 'function 名字',
  PRIMARY KEY (`auth_role_id`),
  UNIQUE KEY `auth_role_unique` (`name`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('1', 'super admin', '0,1,2,3,4,5,6,7,8,9,10,11,12', '0,1,2,3', '0,1,2,3', '0,1,2,3,4,5,6', '2017-11-20 11:30:05', 'brucel@cn.ibm.com', '2017-11-20 11:30:05', 'brucel@cn.ibm.com', '0', null, null);
INSERT INTO `auth_role` VALUES ('2', ' admin', '0,1,2,3,4', '1,2,3', '0,1,2', '0,1,2,3', '2017-11-01 14:39:58', 'brucel@cn.ibm.com', '2017-11-01 14:40:16', 'brucel@cn.ibm.com', '0', '1', '1');
INSERT INTO `auth_role` VALUES ('3', 'function manager', '0,1,2,3,4,5,6,7,8,9,10,11,12', '0,1,2,3', '0,1,2,3', '0,1,2,3,4,5,6', '2017-11-16 10:41:31', 'brucel@cn.ibm.com', '2017-11-16 10:41:31', 'brucel@cn.ibm.com', '0', '2', null);
INSERT INTO `auth_role` VALUES ('4', 'team manager', '0,1,2,3,4,5,6,7,8,9,10,11,12', '0,1,2,3', '0,1,2,3', '0,1,2,3,4,5,6', '2017-11-02 16:41:21', 'brucel@cn.ibm.com', '2017-11-02 16:41:21', 'brucel@cn.ibm.com', '0', null, null);
INSERT INTO `auth_role` VALUES ('5', 'test manager', '9,12', '0', '1,3', '0,3', '2017-11-02 16:44:48', 'brucel@cn.ibm.com', '2017-11-02 16:44:48', 'brucel@cn.ibm.com', '0', null, null);
INSERT INTO `auth_role` VALUES ('6', 'testsdfs manager', '3', '3', '0,3', '0', '2017-11-02 17:06:23', 'brucel@cn.ibm.com', '2017-11-02 17:06:23', 'brucel@cn.ibm.com', '0', null, null);
INSERT INTO `auth_role` VALUES ('7', 'dsrfadsfdsf manager', '3', '3', '0,3', '0,3', '2017-11-02 17:14:18', 'brucel@cn.ibm.com', '2017-11-06 11:12:31', 'brucel@cn.ibm.com', '0', null, null);
INSERT INTO `auth_role` VALUES ('8', 'fdgdf gs manager', '3', '3', '2', '0', '2017-11-02 17:15:47', 'brucel@cn.ibm.com', '2017-11-06 11:12:17', 'brucel@cn.ibm.com', '0', null, null);
INSERT INTO `auth_role` VALUES ('9', 'werewqfvdsgs manager', '3', '3', '3', '0,3', '2017-11-02 17:17:26', 'brucel@cn.ibm.com', '2017-11-07 10:20:35', 'brucel@cn.ibm.com', '1', null, null);
INSERT INTO `auth_role` VALUES ('10', 'CPC-PP admin', '0,3,6', '0', '0', '0,3,6', '2017-11-03 11:30:35', 'brucel@cn.ibm.com', '2017-11-07 10:20:15', 'brucel@cn.ibm.com', '1', '1', '1');
INSERT INTO `auth_role` VALUES ('11', 'PPPPPP admin', '0,3,6,9,12', '0,3', '0,3', '0,3,6', '2017-11-03 15:34:32', 'brucel@cn.ibm.com', '2017-11-07 10:11:18', 'brucel@cn.ibm.com', '1', '2', '6');
INSERT INTO `auth_role` VALUES ('12', 'LLLLL admin', '0,3,6,9,12', '0,3', '0,3', '0,3,6', '2017-11-03 15:36:25', 'brucel@cn.ibm.com', '2017-11-07 10:10:11', 'brucel@cn.ibm.com', '1', '2', '6');
INSERT INTO `auth_role` VALUES ('13', 'EEEEEEE', '0,3,6,9,12', '0,3', '0,1,3', '0,3,6', '2017-11-06 10:37:27', 'brucel@cn.ibm.com', '2017-11-06 11:13:12', 'brucel@cn.ibm.com', '1', '5', '8');
INSERT INTO `auth_role` VALUES ('14', 'test1', '0', '0,3', '0,3', '0', '2017-11-06 10:37:59', 'brucel@cn.ibm.com', '2017-11-06 11:13:08', 'brucel@cn.ibm.com', '1', '2', '6');
INSERT INTO `auth_role` VALUES ('15', 'cxvcxv manager', '0,3,6,9,12', '0,1,3', '0,1,3', '0,3,6', '2017-11-09 17:23:53', 'brucel@cn.ibm.com', '2017-11-09 17:23:53', 'brucel@cn.ibm.com', '0', '1', '1');
INSERT INTO `auth_role` VALUES ('16', 'test admin', '', null, null, null, '2017-11-20 10:51:07', 'brucel@cn.ibm.com', '2017-11-20 10:51:07', 'brucel@cn.ibm.com', '0', '1', '2');

-- ----------------------------
-- Table structure for bu
-- ----------------------------
DROP TABLE IF EXISTS `bu`;
CREATE TABLE `bu` (
  `BU_id` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Business Unit',
  `name` varchar(100) DEFAULT NULL COMMENT 'BU 名字',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_operator` varchar(100) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_operator` varchar(100) DEFAULT NULL COMMENT '更新者',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  PRIMARY KEY (`BU_id`),
  UNIQUE KEY `BU_unique` (`name`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bu
-- ----------------------------
INSERT INTO `bu` VALUES ('1', 'CPC', '2017-09-20 13:54:46', 'brucel@cn.ibm.com', '2017-09-20 13:55:02', 'brucel@cn.ibm.com', '0');
INSERT INTO `bu` VALUES ('2', 'GDC', '2017-09-20 13:54:46', 'brucel@cn.ibm.com', '2017-09-20 13:55:02', 'brucel@cn.ibm.com', '0');
INSERT INTO `bu` VALUES ('3', 'GBS-edit', '2017-10-24 11:34:43', 'brucel@cn.ibm.com', '2017-10-24 11:35:12', 'brucel@cn.ibm.com', '1');
INSERT INTO `bu` VALUES ('4', 'ABC', '2017-10-24 11:36:19', 'brucel@cn.ibm.com', '2017-10-24 11:36:19', 'brucel@cn.ibm.com', '0');
INSERT INTO `bu` VALUES ('5', 'QWER', '2017-11-01 10:43:15', 'brucel@cn.ibm.com', '2017-11-01 10:43:15', 'brucel@cn.ibm.com', '0');
INSERT INTO `bu` VALUES ('6', 'QQQQQ', '2017-11-01 10:53:17', 'brucel@cn.ibm.com', '2017-11-01 10:53:17', 'brucel@cn.ibm.com', '0');
INSERT INTO `bu` VALUES ('7', 'SSSSSSS', '2017-11-01 10:53:58', 'brucel@cn.ibm.com', '2017-11-09 14:24:07', 'brucel@cn.ibm.com', '0');
INSERT INTO `bu` VALUES ('8', 'ASDFG', '2017-11-01 10:54:24', 'brucel@cn.ibm.com', '2017-11-09 14:23:57', 'brucel@cn.ibm.com', '0');
INSERT INTO `bu` VALUES ('9', 'ZXCVB', '2017-11-09 14:24:39', 'brucel@cn.ibm.com', '2017-11-09 14:24:39', 'brucel@cn.ibm.com', '0');
INSERT INTO `bu` VALUES ('10', 'QAZWSX', '2017-11-09 14:27:34', 'brucel@cn.ibm.com', '2017-11-09 14:27:34', 'brucel@cn.ibm.com', '0');

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` (
  `C_id` int(15) NOT NULL AUTO_INCREMENT COMMENT 'commodity id',
  `name` varchar(100) DEFAULT NULL COMMENT 'commodity 名字',
  `J_id` int(15) NOT NULL COMMENT '所属function id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_operator` varchar(100) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_operator` varchar(100) DEFAULT NULL COMMENT '更新者',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  PRIMARY KEY (`C_id`),
  UNIQUE KEY `function_unique` (`name`,`J_id`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('1', 'Platform', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `commodity` VALUES ('2', 'ECAT', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `commodity` VALUES ('3', 'PCB', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `commodity` VALUES ('4', 'dsfasdfdsf', '1', null, null, '2017-10-23 11:10:49', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('5', 'aaaaaa', '1', '2017-10-23 10:47:30', 'brucel@cn.ibm.com', '2017-10-23 11:12:52', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('6', 'bbbbbbbbbbbb', '2', '2017-10-23 10:49:32', 'brucel@cn.ibm.com', '2017-10-23 10:49:32', 'brucel@cn.ibm.com', '0');
INSERT INTO `commodity` VALUES ('7', 'CCCCCCC', '9', '2017-10-23 10:51:32', 'brucel@cn.ibm.com', '2017-10-23 11:12:33', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('8', 'DDDDDD', '2', '2017-10-23 10:53:36', 'brucel@cn.ibm.com', '2017-10-23 11:12:44', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('9', 'EEEEEE', '5', '2017-10-23 10:54:08', 'brucel@cn.ibm.com', '2017-10-23 11:11:38', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('10', 'DDDDDD', '1', '2017-10-23 11:13:12', 'brucel@cn.ibm.com', '2017-10-23 11:16:02', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('13', 'DDDDDD', '2', '2017-10-23 11:14:00', 'brucel@cn.ibm.com', '2017-10-23 11:14:00', 'brucel@cn.ibm.com', '0');
INSERT INTO `commodity` VALUES ('14', 'dsfadg', '3', '2017-10-23 13:39:14', 'brucel@cn.ibm.com', '2017-10-23 13:39:14', 'brucel@cn.ibm.com', '0');
INSERT INTO `commodity` VALUES ('15', 'dsfadg-sdfa', '1', '2017-10-23 13:39:26', 'brucel@cn.ibm.com', '2017-10-23 13:39:38', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('16', 'Platform-dfsag', '1', '2017-10-23 14:48:09', 'brucel@cn.ibm.com', '2017-10-23 14:48:09', 'brucel@cn.ibm.com', '0');
INSERT INTO `commodity` VALUES ('17', 'Platform-dfsag--bvj', '1', '2017-10-23 14:48:29', 'brucel@cn.ibm.com', '2017-10-23 17:11:34', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('18', 'EEEEEEEEEEEEEEEEE', '1', '2017-10-23 15:32:11', 'brucel@cn.ibm.com', '2017-10-23 17:02:01', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('19', 'RRRRR', '22', '2017-10-23 16:40:22', 'brucel@cn.ibm.com', '2017-10-23 17:01:48', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('20', 'ZZZZZZZZZZZZZ', '5', '2017-10-23 17:10:44', 'brucel@cn.ibm.com', '2017-10-23 17:11:29', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('21', 'JJJJJJJJJJJJJJJJJ', '20', '2017-10-23 17:11:20', 'brucel@cn.ibm.com', '2017-10-23 17:11:26', 'brucel@cn.ibm.com', '1');
INSERT INTO `commodity` VALUES ('22', 'HHHHH', '8', '2017-10-23 17:11:45', 'brucel@cn.ibm.com', '2017-10-23 17:28:24', 'brucel@cn.ibm.com', '0');
INSERT INTO `commodity` VALUES ('23', '11111111111111111', '24', '2017-10-24 10:38:16', 'brucel@cn.ibm.com', '2017-10-24 10:38:16', 'brucel@cn.ibm.com', '0');
INSERT INTO `commodity` VALUES ('24', 'CCCCCCCCCCC', '2', '2017-10-24 10:41:18', 'brucel@cn.ibm.com', '2017-11-09 14:23:18', 'brucel@cn.ibm.com', '0');
INSERT INTO `commodity` VALUES ('25', 'EDCGDGDGF', '32', '2017-11-09 14:28:51', 'brucel@cn.ibm.com', '2017-11-09 14:28:51', 'brucel@cn.ibm.com', '0');

-- ----------------------------
-- Table structure for feedback_record
-- ----------------------------
DROP TABLE IF EXISTS `feedback_record`;
CREATE TABLE `feedback_record` (
  `f_id` int(15) NOT NULL AUTO_INCREMENT,
  `user_id` int(15) NOT NULL COMMENT '用户ID',
  `email` varchar(255) NOT NULL COMMENT '反馈者邮箱',
  `esubject` varchar(1000) DEFAULT NULL COMMENT '主题',
  `content` varchar(3000) DEFAULT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback_record
-- ----------------------------

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `F_id` int(15) NOT NULL AUTO_INCREMENT COMMENT 'function id',
  `name` varchar(100) DEFAULT NULL COMMENT 'function 名字',
  `BU_id` int(15) NOT NULL COMMENT '所属BU id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_operator` varchar(100) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_operator` varchar(100) DEFAULT NULL COMMENT '更新者',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  PRIMARY KEY (`F_id`),
  UNIQUE KEY `function_unique` (`name`,`BU_id`,`deleted`),
  KEY `BU_id` (`BU_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES ('1', 'PP', '1', '2017-09-20 14:00:34', 'brucel@cn.ibm.com', '2017-09-20 14:00:38', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('2', 'PI', '1', '2017-09-20 14:00:34', 'brucel@cn.ibm.com', '2017-09-20 14:00:38', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('3', 'Finance', '1', '2017-09-20 14:00:34', 'brucel@cn.ibm.com', '2017-09-20 14:00:38', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('4', 'DSA', '1', '2017-09-20 14:00:34', 'brucel@cn.ibm.com', '2017-09-20 14:00:38', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('5', 'COSSM', '2', '2017-09-20 14:00:34', 'brucel@cn.ibm.com', '2017-09-20 14:00:38', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('6', 'ENG', '2', '2017-09-20 14:00:34', 'brucel@cn.ibm.com', '2017-09-20 14:00:38', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('7', 'PNGQQQQQQ', '1', '2017-10-24 11:10:29', 'brucel@cn.ibm.com', '2017-10-24 11:15:36', 'brucel@cn.ibm.com', '1');
INSERT INTO `function` VALUES ('8', 'dsafds', '5', '2017-11-01 10:45:16', 'brucel@cn.ibm.com', '2017-11-01 10:45:16', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('9', 'CCCCCfdgdsfg sdfg', '2', '2017-11-01 10:58:32', 'brucel@cn.ibm.com', '2017-11-01 10:58:32', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('10', 'ASDFG', '2', '2017-11-01 10:59:12', 'brucel@cn.ibm.com', '2017-11-01 10:59:12', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('11', 'ZXCV', '4', '2017-11-01 11:00:46', 'brucel@cn.ibm.com', '2017-11-01 11:00:46', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('12', 'ASDFG', '5', '2017-11-01 11:01:52', 'brucel@cn.ibm.com', '2017-11-01 11:01:52', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('13', 'ASDFGdfdsaf', '1', '2017-11-01 11:06:15', 'brucel@cn.ibm.com', '2017-11-01 11:06:15', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('14', 'ASDFGdfdsafdsfadsf', '2', '2017-11-01 11:07:27', 'brucel@cn.ibm.com', '2017-11-01 11:07:27', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('15', 'QAZXSWEDC', '2', '2017-11-01 11:08:16', 'brucel@cn.ibm.com', '2017-11-01 11:08:16', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('16', 'QAZXSRFVC', '2', '2017-11-01 11:08:58', 'brucel@cn.ibm.com', '2017-11-01 11:08:58', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('17', 'lkjhljjgfh', '1', '2017-11-01 11:09:50', 'brucel@cn.ibm.com', '2017-11-09 14:24:24', 'brucel@cn.ibm.com', '0');
INSERT INTO `function` VALUES ('18', 'PQWP', '10', '2017-11-09 14:27:56', 'brucel@cn.ibm.com', '2017-11-09 14:27:56', 'brucel@cn.ibm.com', '0');

-- ----------------------------
-- Table structure for job_role
-- ----------------------------
DROP TABLE IF EXISTS `job_role`;
CREATE TABLE `job_role` (
  `J_id` int(15) NOT NULL AUTO_INCREMENT COMMENT 'job role id',
  `name` varchar(100) DEFAULT NULL COMMENT 'job role 名字',
  `F_id` int(15) NOT NULL COMMENT '所属function id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_operator` varchar(100) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_operator` varchar(100) DEFAULT NULL COMMENT '更新者',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  PRIMARY KEY (`J_id`),
  UNIQUE KEY `function_unique` (`name`,`F_id`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_role
-- ----------------------------
INSERT INTO `job_role` VALUES ('1', 'GCM', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('2', 'BC', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('3', 'Admin', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('4', 'Government relationship', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('5', 'HR', '5', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('6', 'Assistant of Excutive', '6', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('7', 'Communication', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('8', 'Reception', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('9', 'Consult', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('10', 'PCE', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('11', 'GCM for PCM', '1', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('12', 'DSW NPM', '2', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('13', 'DSW BNPM', '2', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('14', 'BPE', '2', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('15', 'ESW NPM', '2', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('16', 'ESW BNPM', '2', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('17', 'Code Mangerment Team', '2', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('18', 'SAP ', '2', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('19', 'Pring ', '2', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('20', 'CP ', '2', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('21', 'CPC FIN Control', '3', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '1');
INSERT INTO `job_role` VALUES ('22', 'Staff Financial Analyst', '3', '2017-09-20 14:06:09', 'brucel@cn.ibm.com', '2017-09-20 14:06:26', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('23', 'qqqqqq', '6', '2017-10-24 10:22:58', 'brucel@cn.ibm.com', '2017-10-24 10:22:58', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('24', 'wwwww', '6', '2017-10-24 10:24:17', 'brucel@cn.ibm.com', '2017-10-24 10:24:17', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('25', 'aaaa', '1', '2017-10-24 10:38:22', 'brucel@cn.ibm.com', '2017-10-24 10:44:28', 'brucel@cn.ibm.com', '1');
INSERT INTO `job_role` VALUES ('26', 'rrrrrrrr', '1', '2017-10-24 10:38:32', 'brucel@cn.ibm.com', '2017-10-24 10:38:32', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('27', 'QQQQQQQQQQ', '2', '2017-10-24 10:42:15', 'brucel@cn.ibm.com', '2017-10-24 10:44:09', 'brucel@cn.ibm.com', '1');
INSERT INTO `job_role` VALUES ('28', 'YYYYYYY', '1', '2017-11-01 10:55:46', 'brucel@cn.ibm.com', '2017-11-01 10:55:46', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('29', 'BBBBBB', '2', '2017-11-01 10:56:23', 'brucel@cn.ibm.com', '2017-11-01 10:56:23', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('30', 'CCCCC', '2', '2017-11-01 10:57:25', 'brucel@cn.ibm.com', '2017-11-01 10:57:25', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('31', 'CCCCCdsdff', '1', '2017-11-01 10:58:05', 'brucel@cn.ibm.com', '2017-11-01 10:58:05', 'brucel@cn.ibm.com', '0');
INSERT INTO `job_role` VALUES ('32', 'job role sddaf', '18', '2017-11-09 14:28:26', 'brucel@cn.ibm.com', '2017-11-09 14:28:26', 'brucel@cn.ibm.com', '0');

-- ----------------------------
-- Table structure for mail_template
-- ----------------------------
DROP TABLE IF EXISTS `mail_template`;
CREATE TABLE `mail_template` (
  `temp_id` int(15) NOT NULL AUTO_INCREMENT,
  `access_id` int(15) NOT NULL COMMENT 'access ID',
  `subject_title` varchar(1000) NOT NULL COMMENT '邮件标题',
  `content` text NOT NULL COMMENT '邮件内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_operator` varchar(100) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_operator` varchar(100) DEFAULT NULL COMMENT '更新者',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail_template
-- ----------------------------
INSERT INTO `mail_template` VALUES ('1', '3', 'Request for access to Platform Procurement Quote Room', 'Hi Susan\r\n\r\nI am the new Platform GCM (Admin). Please provide me the access to the Platform Procurement Quote Room. This is needed for GCM (Admin) use.\r\n\r\nThanks!', '2017-08-08 03:23:38', 'szrhlong@cn.ibm.com', '2017-11-21 10:59:19', 'brucel@cn.ibm.com', '0');
INSERT INTO `mail_template` VALUES ('2', '10', 'Request for access to Tracker Team Room', 'Hi Michelle\r\n\r\nI am XXX from Platform GCM team. Please provide me the access to the Tracker Team Room. I need the access for daily procurement work.\r\n\r\nThanks!\r\n', '2017-08-08 03:47:53', 'szrhlong@cn.ibm.com', null, null, '0');
INSERT INTO `mail_template` VALUES ('3', '17', 'Request for access to Council Server', 'Hi\r\nI am XXX from BC & Operation team. Please provide me the link to apply for access to the Council Server.\r\n\r\nThanks!', '2017-08-08 10:13:52', 'szrhlong@cn.ibm.com', null, null, '0');
INSERT INTO `mail_template` VALUES ('4', '0', 'Request for access to off-spec DB', '\"Dear  Dale\r\n\r\nI would like to apply the access xxx. This is necessary for PQE daily work. Please review and highly appreciate your approval.\r\n\r\nThanks!\"\r\n', '2017-08-08 16:12:01', 'szrhlong@cn.ibm.com', null, null, '0');
INSERT INTO `mail_template` VALUES ('5', '0', 'Request for access to Product Manager', '\"Dear  Joyce\r\n\r\nI would like to apply the access xxx.This is necessary for xxx Job Role daily work. Please review and highly appreciate your approval.\r\n\r\nThanks!\"\r\n', '2017-08-08 16:15:31', 'szrhlong@cn.ibm.com', null, null, '0');
INSERT INTO `mail_template` VALUES ('6', '54', 'Request for access to Stop Ship', '\"Dear  Linda\r\n\r\nI would like to apply the access to Stop Ship. This is necessary for PQE daily work. Please review and highly appreciate your approval.\r\n\r\nThanks!\"\r\n', '2017-08-08 16:19:03', 'szrhlong@cn.ibm.com', null, null, '0');
INSERT INTO `mail_template` VALUES ('8', '2', 'Request for access to Platform Procurement Quote Room', '\"Dear  Linda\r\n\r\nI would like to apply the access to Stop Ship. This is necessary for PQE daily work. Please review and highly appreciate your approval.\r\n\r\nThanks!\"', '2017-08-22 16:06:35', 'brucel@cn.ibm.com', null, null, '0');
INSERT INTO `mail_template` VALUES ('9', '15', 'fsdfsdgsad', 'Hi Susan\\r\\n\\r\\nI am the new Platform GCM (Admin). Please provide me the access to the Platform Procurement Quote Room. This is needed for GCM (Admin) use.\\r\\n\\r\\nThanks!', '2017-08-22 16:10:36', 'brucel@cn.ibm.com', null, null, '0');
INSERT INTO `mail_template` VALUES ('10', '13', '鬼地方个地方', '电饭锅电饭锅讽德诵功梵蒂冈 地方', '2017-08-24 11:24:00', 'brucel@cn.ibm.com', null, null, '0');
INSERT INTO `mail_template` VALUES ('11', '59', 'this is a test Email ', 'this is a test Email  this is a test Email  this is a test Email this is a test Email this is a test Email this is a test Email this is a test Email this is a test Email this is a test Email this is a test Email this is a test Email this is a test Email this is a test Email this is a test Email this is a test Email this is a test Email ', '2017-09-05 17:10:18', 'brucel@cn.ibm.com', null, null, '0');
INSERT INTO `mail_template` VALUES ('14', '1', 'kkhjljhlhgjghmhjgk', 'The Email title must be more than 6 and less than 100 characters longThe Email title must be more than 6 and less than 100 characters longThe Email title must be more than 6 and less than 100 characters longThe Email title must be more than 6 and less than 100 characters longThe Email title must be more than 6 and less than 100 characters longThe EmaThe Email Title is required and cannot be emptyil title must be more than 6 and less than 100 characters longyjghkjhgk', '2017-10-17 16:55:29', 'brucel@cn.ibm.com', '2017-10-18 13:39:57', 'brucel@cn.ibm.com', '0');
INSERT INTO `mail_template` VALUES ('16', '4', 'The Email Title is required and cannot be empty', 'The Email Title is required and cannot be emptyThe Email Title is required and cannot be emptyThe Email Title is required and cannot be emptyThe Email Title is required and cannot be emptyThe Email Title is required and cannot be emptyThe Email Title is required and cannot be emptyThe Email Title is required and cannot be emptyThe Email Title is required and cannot be empty', '2017-10-17 17:02:50', 'brucel@cn.ibm.com', '2017-10-17 17:02:50', 'brucel@cn.ibm.com', '0');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(15) NOT NULL AUTO_INCREMENT,
  `access_list` varchar(1000) NOT NULL COMMENT '申请权限列表',
  `function` int(15) NOT NULL COMMENT 'function 名字',
  `BU` int(15) DEFAULT NULL COMMENT 'BU 名字',
  `job_role` int(15) DEFAULT NULL COMMENT 'job_role 名字',
  `commodity` int(15) DEFAULT NULL COMMENT 'commodity 名字',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_operator` varchar(100) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_operator` varchar(100) DEFAULT NULL COMMENT '更新者',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `constraint_job_role_unique` (`function`,`BU`,`job_role`,`commodity`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '13,14,15,16,17,2,3,4,6,7,8,9,10,11,12,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,52,53,55', '1', '1', '1', '1', '2017-08-08 05:58:24', 'szrhlong@cn.ibm.com', '2017-10-30 17:36:58', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('2', '13,14,15,16,17,3,4,6,7,19,20,21,22,23,41,42,43,45,46', '1', '2', '2', '0', '2017-08-08 15:24:28', 'szrhlong@cn.ibm.com', '2017-11-13 16:53:53', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('3', '13,14,15,25,26,27,28,29,30,31,32,33,34', '6', '11', '30', '0', '2017-08-08 15:38:48', 'szrhlong@cn.ibm.com', '2017-09-07 17:44:11', 'szrhlong@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('4', '13,14,15,35,36,37,38,39,40,41,42,43,44,45', '6', '11', '29', '0', '2017-08-08 15:59:07', 'szrhlong@cn.ibm.com', '2017-09-07 17:44:49', 'szrhlong@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('5', '13,14,15,46,47,48,49,50,51,52,53,54,55,56', '6', '14', '35', '0', '2017-08-08 16:22:55', 'szrhlong@cn.ibm.com', '2017-09-07 14:08:30', 'szrhlong@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('6', '13,14,15,1,2,3,4,5,6,7', '1', '1', '1', '2', '2017-08-10 15:56:53', 'brucel@cn.ibm.com', '2017-09-06 15:19:24', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('7', '13,14,15,1,2,3,4,5,6,7,8', '1', '2', '3', '0', '2017-08-10 15:57:13', 'brucel@cn.ibm.com', '2017-08-10 15:57:13', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('8', '13,14,15,1,2,3,4,5,6,7,8', '2', '5', '12', '0', '2017-08-10 15:57:34', 'brucel@cn.ibm.com', '2017-10-31 13:52:49', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('9', '13,14,15,1,2,3,50,51,52,53,54,55,56', '1', '2', '4', '0', '2017-08-10 15:58:05', 'brucel@cn.ibm.com', '2017-08-10 15:58:05', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('10', '13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51', '2', '1', '1', '3', '2017-08-14 23:33:55', 'brucel@cn.ibm.com', '2017-09-07 11:14:51', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('11', '13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,16,17,18,19,20,21,22,23,24,25', '1', '2', '5', '0', '2017-08-14 23:35:50', 'brucel@cn.ibm.com', '2017-08-14 23:35:50', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('12', '13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37', '1', '2', '6', '0', '2017-08-14 23:36:27', 'brucel@cn.ibm.com', '2017-08-14 23:36:27', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('13', '13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,16,17,18,19,20', '1', '2', '7', '0', '2017-08-14 23:36:53', 'brucel@cn.ibm.com', '2017-08-14 23:36:53', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('14', '13,14,15,16,17,3,4,6,7,8,9,10,11,12,19,20,21,22,23,25,26,46,47', '1', '2', '8', '0', '2017-08-14 23:37:25', 'brucel@cn.ibm.com', '2017-10-31 13:50:05', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('15', '13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,16,17,18', '1', '3', '9', '0', '2017-08-14 23:38:48', 'brucel@cn.ibm.com', '2017-10-31 11:35:07', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('16', '13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,16,17,18,19,20,21,22,23,24,25,26,27', '2', '5', '13', '0', '2017-08-14 23:39:42', 'brucel@cn.ibm.com', '2017-10-31 11:35:22', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('17', '13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43', '2', '5', '14', '0', '2017-08-14 23:40:33', 'brucel@cn.ibm.com', '2017-10-31 11:35:15', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('18', '13,14,15,16,17,3,4,6,7,8,9,10,11,12,19,20,21,22,23,25,26,27,28,29,30,31,32,33,46,47', '2', '5', '15', '0', '2017-08-14 23:41:12', 'brucel@cn.ibm.com', '2017-10-31 13:52:40', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('19', '13,14,15,1,2,3,4,5,6,7,8,9,10,11,12,16,17', '2', '5', '16', '0', '2017-08-15 09:18:28', 'brucel@cn.ibm.com', '2017-10-31 13:52:32', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('20', '13,14,15,57,58,59,1', '2', '1', '1', '3', '2017-09-07 15:02:11', 'brucel@cn.ibm.com', '2017-09-07 15:02:11', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('21', '13,14,15,57,1,2,3,54,55,56', '7', '15', '36', '4', '2017-09-21 17:46:57', 'brucel@cn.ibm.com', '2017-10-31 13:52:16', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('22', '13,14,15,46,47', '1', '4', '10', '0', '2017-09-21 18:39:58', 'brucel@cn.ibm.com', '2017-10-31 13:51:33', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('23', '13,14,15,57,58,1,2,3', '7', '15', '36', '5', '2017-09-21 18:41:25', 'brucel@cn.ibm.com', '2017-10-31 11:42:24', 'brucel@cn.ibm.com', '1');
INSERT INTO `role` VALUES ('24', '13,14,15,16,17,3,4,7', '1', '1', '10', null, '2017-10-31 14:49:58', 'brucel@cn.ibm.com', '2017-10-31 14:49:58', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('25', '13,15,17,4,41,42,43,45,46,47', '1', '1', '1', '16', '2017-10-31 14:59:24', 'brucel@cn.ibm.com', '2017-10-31 15:00:05', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('26', '13,15,3,6,43,45,46', '6', '2', '24', '23', '2017-10-31 15:32:19', 'brucel@cn.ibm.com', '2017-10-31 15:32:19', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('27', '13,15,17,3,6,46', '5', '2', '5', null, '2017-10-31 15:32:43', 'brucel@cn.ibm.com', '2017-10-31 15:37:15', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('28', '13,15,6,45,46', '3', '1', '22', null, '2017-10-31 15:33:01', 'brucel@cn.ibm.com', '2017-10-31 15:33:01', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('29', '13,11,19,46', '2', '1', '15', null, '2017-10-31 15:33:16', 'brucel@cn.ibm.com', '2017-10-31 15:33:16', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('30', '13,15,17,12,20,39,41,42,43,45,46', '2', '1', '14', null, '2017-10-31 15:33:33', 'brucel@cn.ibm.com', '2017-10-31 15:33:33', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('31', '13,14,15,16,17,3,4,6,7,8,10,12,20', '2', '1', '20', null, '2017-10-31 15:33:47', 'brucel@cn.ibm.com', '2017-10-31 15:33:47', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('32', '13,14,15,16,17,22,25,27,43,45,46', '2', '1', '17', null, '2017-10-31 15:34:04', 'brucel@cn.ibm.com', '2017-10-31 15:34:04', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('33', '13,14,15,16,17,43,46', '2', '1', '13', null, '2017-10-31 15:34:18', 'brucel@cn.ibm.com', '2017-10-31 15:34:18', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('34', '13,17,3,6,8,43,45,46', '2', '1', '14', null, '2017-10-31 15:34:29', 'brucel@cn.ibm.com', '2017-10-31 15:36:02', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('35', '17,3', '2', '1', '15', null, '2017-10-31 15:34:38', 'brucel@cn.ibm.com', '2017-10-31 15:34:38', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('36', '13,15,17,45', '2', '1', '18', '24', '2017-10-31 15:54:57', 'brucel@cn.ibm.com', '2017-10-31 15:54:57', 'brucel@cn.ibm.com', '0');
INSERT INTO `role` VALUES ('37', '13,15,17,45,46', '1', '1', '26', null, '2017-10-31 15:56:57', 'brucel@cn.ibm.com', '2017-10-31 15:56:57', 'brucel@cn.ibm.com', '0');

-- ----------------------------
-- Table structure for send_record
-- ----------------------------
DROP TABLE IF EXISTS `send_record`;
CREATE TABLE `send_record` (
  `record_id` int(15) NOT NULL AUTO_INCREMENT,
  `user_id` int(15) NOT NULL COMMENT '用户ID',
  `email` varchar(255) NOT NULL COMMENT '发送人邮箱',
  `receive_email` varchar(255) NOT NULL COMMENT '接收人邮箱',
  `email_subject` varchar(1000) DEFAULT NULL COMMENT '邮件主题',
  `content` varchar(3000) DEFAULT NULL COMMENT '邮件内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  `access_id` int(15) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of send_record
-- ----------------------------
INSERT INTO `send_record` VALUES ('1', '1', 'brucel@cn.ibm.com', 'xxx@us.ibm.com', '热太热问题都发给对方是个电饭锅', ' nullsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetInt setIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetInts etIntsetIntsetIntsetInt', '2017-08-11 14:48:48', '0', '54');
INSERT INTO `send_record` VALUES ('2', '1', 'brucel@cn.ibm.com', 'xxx@us.ibm.com', '热太热问题都发给对方是个电饭锅', ' nullsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetInt setIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetInts etIntsetIntsetIntsetInt', '2017-08-11 14:48:48', '0', '54');
INSERT INTO `send_record` VALUES ('3', '1', 'brucel@cn.ibm.com', 'xxx@us.ibm.com', '热太热问题都发给对方是个电饭锅', ' nullsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetInt setIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetIntsetInts etIntsetIntsetIntsetInt', '2017-08-11 14:48:48', '0', '54');
INSERT INTO `send_record` VALUES ('4', '1', 'brucel@cn.ibm.com', 'Bruce@cn.ibm.com', '鬼地方个dfgfdgdfg', '电饭锅电饭锅讽德诵功梵蒂冈 地方dfgsdfg										fdgdfsgdfgs', null, '0', '13');
INSERT INTO `send_record` VALUES ('5', '1', 'brucel@cn.ibm.com', 'Bruce@cn.ibm.com', '鬼地方个dfgfdgdfg', '电饭锅电饭锅讽德诵功梵蒂冈 地方dfgsdfg										fdgdfsgdfgsgfbhfggdhggf', null, '0', '13');
INSERT INTO `send_record` VALUES ('6', '1', 'brucel@cn.ibm.com', 'Bruce@cn.ibm.com', '鬼地方个dfgfdgdfg', '电饭锅电饭锅讽德诵功梵蒂冈 地方dfgsdfg										fdgdfsgdfgsgfbhfggdhggf fgfhd', null, '0', '13');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(15) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `function` int(15) DEFAULT NULL COMMENT '所属function',
  `BU` int(15) DEFAULT NULL COMMENT 'BU 名字',
  `remember` varchar(100) DEFAULT NULL COMMENT '记住选择的角色',
  `authorization_role` int(10) DEFAULT '0' COMMENT '权限角色,0为默认最低权限，1000为超级管理员，其他数字对应function编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_operator` varchar(100) DEFAULT NULL COMMENT '更新者',
  `actived` int(10) DEFAULT '1' COMMENT '是否激活，1为激活，0 为未激活',
  `deleted` int(10) DEFAULT '0' COMMENT '是否删除，0为未删除 ,1 为删除',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_uq` (`Email`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'brucel@cn.ibm.com', '1000', '1', '1,1,1,2', '1', '2017-08-08 02:55:04', '2017-11-21 13:56:09', 'brucel@cn.ibm.com', '1', '0');
INSERT INTO `user` VALUES ('3', 'szrhlong@cn.ibm.com', '1000', '0', null, '2', '2017-08-08 03:06:07', '2017-09-06 11:57:34', 'brucel@cn.ibm.com', '1', '0');
INSERT INTO `user` VALUES ('4', 'yolandaf@cn.ibm.com', '1000', '0', null, '2', '2017-08-08 05:32:00', '2017-09-06 11:57:29', 'brucel@cn.ibm.com', '1', '0');
INSERT INTO `user` VALUES ('5', 'jianz@cn.ibm.com', '1', '0', null, '4', '2017-08-10 09:29:34', '2017-09-07 14:59:39', 'brucel@cn.ibm.com', '1', '1');
INSERT INTO `user` VALUES ('6', 'szwjuan@cn.ibm.com', '1000', '0', null, '4', '2017-08-14 03:49:47', '2017-09-07 11:58:36', 'brucel@cn.ibm.com', '1', '0');
INSERT INTO `user` VALUES ('7', 'cindyx@cn.ibm.com', '1000', '0', null, '7', '2017-08-14 09:58:14', '2017-09-07 17:48:16', 'brucel@cn.ibm.com', '1', '1');
INSERT INTO `user` VALUES ('8', 'cm1@us.ibm.com', null, null, null, '7', '2017-08-14 12:49:36', null, null, '1', '0');
INSERT INTO `user` VALUES ('9', 'joycehxy@cn.ibm.com', null, null, null, '3', '2017-08-15 02:21:11', '2017-11-06 18:02:29', 'brucel@cn.ibm.com', '1', '0');
INSERT INTO `user` VALUES ('10', 'zhangqc@cn.ibm.com', null, null, null, '7', '2017-08-15 09:36:01', null, null, '1', '0');
INSERT INTO `user` VALUES ('11', 'chenxd@cn.ibm.com', null, null, null, '8', '2017-08-15 10:59:32', null, null, '1', '0');
INSERT INTO `user` VALUES ('12', 'methomps@us.ibm.com', null, null, null, '0', '2017-08-15 16:36:51', null, null, '1', '0');
INSERT INTO `user` VALUES ('13', 'sarahg@cn.ibm.com', null, null, null, '8', '2017-08-16 02:20:48', null, null, '1', '0');
INSERT INTO `user` VALUES ('14', 'jcmarine@us.ibm.com', null, null, null, '0', '2017-08-16 22:06:50', null, null, '1', '0');
INSERT INTO `user` VALUES ('15', 'amberz@cn.ibm.com', null, null, null, '2', '2017-08-17 01:41:17', null, null, '1', '0');
INSERT INTO `user` VALUES ('16', 'treesonl@cn.ibm.com', null, null, '2,7,12,null', '0', '2017-08-17 02:13:36', '2017-08-17 02:14:14', null, '1', '0');
INSERT INTO `user` VALUES ('17', 'bshenton@au1.ibm.com', null, null, null, '1', '2017-08-17 04:24:23', null, null, '1', '0');
INSERT INTO `user` VALUES ('18', 'klunney@uk.ibm.com', null, null, null, '3', '2017-08-17 08:49:16', null, null, '1', '0');
INSERT INTO `user` VALUES ('19', 'ricardow@br.ibm.com', null, null, null, '0', '2017-08-17 10:47:41', null, null, '1', '0');
INSERT INTO `user` VALUES ('20', 'wyuan@us.ibm.com', null, null, null, '1', '2017-08-17 17:12:36', null, null, '1', '0');
INSERT INTO `user` VALUES ('21', 'arielk@il.ibm.com', null, null, null, '4', '2017-08-17 19:07:54', '2017-11-07 10:04:11', 'brucel@cn.ibm.com', '1', '0');
INSERT INTO `user` VALUES ('22', 'alexander.stoll@de.ibm.com', null, null, null, '3', '2017-08-18 09:31:20', '2017-11-07 10:16:40', 'brucel@cn.ibm.com', '1', '1');
INSERT INTO `user` VALUES ('23', 'Anna.Hunyadi1@ibm.com', null, null, null, '0', '2017-08-18 10:37:23', null, null, '1', '0');
INSERT INTO `user` VALUES ('24', 'jcmartin@mx1.ibm.com', null, null, null, '2', '2017-08-18 17:16:24', '2017-11-07 10:20:08', 'brucel@cn.ibm.com', '1', '1');
INSERT INTO `user` VALUES ('25', 'stitus1@us.ibm.com', null, null, '1,1,1,1', '4', '2017-08-18 20:00:57', '2017-08-18 20:01:44', null, '1', '0');
INSERT INTO `user` VALUES ('26', 'maellyn@cn.ibm.com', null, null, null, '3', '2017-08-21 11:42:29', null, null, '1', '0');
INSERT INTO `user` VALUES ('27', 'brano.martis@sk.ibm.com', null, null, null, '4', '2017-08-21 12:44:12', null, null, '1', '0');
INSERT INTO `user` VALUES ('28', 'xujiesz@cn.ibm.com', '1000', '0', null, '0', '2017-08-22 07:28:01', '2017-09-07 12:03:03', 'brucel@cn.ibm.com', '1', '1');
INSERT INTO `user` VALUES ('29', 'gabriella.varga@hu.ibm.com', null, null, null, '35', '2017-08-22 08:28:56', null, null, '1', '0');
INSERT INTO `user` VALUES ('30', 'diaodydy@cn.ibm.com', null, null, null, '0', '2017-08-22 08:56:17', null, null, '1', '0');
INSERT INTO `user` VALUES ('31', 'szyuansq@cn.ibm.com', '1000', '0', null, '3', '2017-09-06 10:07:21', '2017-09-07 12:02:57', 'brucel@cn.ibm.com', '1', '1');
INSERT INTO `user` VALUES ('36', 'wlangsz@cn.ibm.com', null, null, null, '2', '2017-11-06 15:32:32', '2017-11-09 14:29:54', 'brucel@cn.ibm.com', '1', '0');
INSERT INTO `user` VALUES ('37', 'dsfsdfa@cn.ibm.com', null, null, null, '5', null, '2017-11-06 17:53:48', 'brucel@cn.ibm.com', '1', '0');
INSERT INTO `user` VALUES ('38', '11111@cn.ibm.com', null, null, null, '10', null, '2017-11-07 10:20:48', 'brucel@cn.ibm.com', '1', '1');
INSERT INTO `user` VALUES ('39', 'qqqqqqqqq@cn.ibm.com', null, null, null, '10', null, '2017-11-07 10:20:46', 'brucel@cn.ibm.com', '1', '1');
INSERT INTO `user` VALUES ('40', 'wwwwww@cn.ibm.com', null, null, null, '9', null, '2017-11-07 10:20:44', 'brucel@cn.ibm.com', '1', '1');
INSERT INTO `user` VALUES ('41', 'dsfadsfad@cn.ibm.com', null, null, null, '8', null, '2017-11-07 10:21:01', 'brucel@cn.ibm.com', '1', '0');
