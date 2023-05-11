-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: communityportal
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `UserID` int NOT NULL,
  `JobID` int NOT NULL,
  PRIMARY KEY (`UserID`,`JobID`),
  KEY `JobID` (`JobID`),
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `comuser` (`UserID`),
  CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`JobID`) REFERENCES `job` (`JobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkemail`
--

DROP TABLE IF EXISTS `bulkemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkemail` (
  `BulkID` int NOT NULL,
  `BEContent` varchar(1000) NOT NULL,
  `BEDate` varchar(50) NOT NULL,
  PRIMARY KEY (`BulkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkemail`
--

LOCK TABLES `bulkemail` WRITE;
/*!40000 ALTER TABLE `bulkemail` DISABLE KEYS */;
INSERT INTO `bulkemail` VALUES (1,'Poisoning by antiparkinsonism drugs and other central muscle-tone depressants, undetermined, initial encounter','4/30/2022'),(2,'Congenital occlusion of ureterovesical orifice','11/3/2021'),(3,'Other shellfish poisoning, intentional self-harm, subsequent encounter','11/15/2021'),(4,'Dislocation of T8/T9 thoracic vertebra','10/7/2022'),(5,'Pedestrian on foot injured in collision with other pedestrian conveyance, subsequent encounter','12/10/2021'),(6,'Corrosions involving 90% or more of body surface with 20-29% third degree corrosion','7/2/2022'),(7,'Dacryolith of bilateral lacrimal passages','8/31/2022'),(8,'Poisoning by lysergide [LSD], intentional self-harm, initial encounter','1/3/2022'),(9,'Torus fracture of lower end of left fibula, subsequent encounter for fracture with nonunion','11/16/2021'),(10,'Corrosion of unspecified degree of back of right hand, sequela','6/15/2022');
/*!40000 ALTER TABLE `bulkemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comadmin`
--

DROP TABLE IF EXISTS `comadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comadmin` (
  `AdminID` int NOT NULL,
  `UserID` int NOT NULL,
  `BulkID` int NOT NULL,
  PRIMARY KEY (`AdminID`),
  KEY `UserID` (`UserID`),
  KEY `BulkID` (`BulkID`),
  CONSTRAINT `comadmin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `comuser` (`UserID`),
  CONSTRAINT `comadmin_ibfk_2` FOREIGN KEY (`BulkID`) REFERENCES `bulkemail` (`BulkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comadmin`
--

LOCK TABLES `comadmin` WRITE;
/*!40000 ALTER TABLE `comadmin` DISABLE KEYS */;
INSERT INTO `comadmin` VALUES (1,1,1);
/*!40000 ALTER TABLE `comadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comuser`
--

DROP TABLE IF EXISTS `comuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comuser` (
  `UserID` int NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(50) NOT NULL,
  `ProfileID` int NOT NULL,
  `RoleID` int NOT NULL,
  `ThreadID` int NOT NULL,
  `JobID` int NOT NULL,
  `MesID` int NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `JobID` (`JobID`),
  KEY `MesID` (`MesID`),
  KEY `ProfileID` (`ProfileID`),
  KEY `RoleID` (`RoleID`),
  KEY `ThreadID` (`ThreadID`),
  CONSTRAINT `comuser_ibfk_1` FOREIGN KEY (`JobID`) REFERENCES `job` (`JobID`),
  CONSTRAINT `comuser_ibfk_2` FOREIGN KEY (`MesID`) REFERENCES `message` (`MesID`),
  CONSTRAINT `comuser_ibfk_3` FOREIGN KEY (`ProfileID`) REFERENCES `userprofile` (`ProfileID`),
  CONSTRAINT `comuser_ibfk_4` FOREIGN KEY (`RoleID`) REFERENCES `userrole` (`RoleID`),
  CONSTRAINT `comuser_ibfk_5` FOREIGN KEY (`ThreadID`) REFERENCES `thread` (`ThreadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comuser`
--

LOCK TABLES `comuser` WRITE;
/*!40000 ALTER TABLE `comuser` DISABLE KEYS */;
INSERT INTO `comuser` VALUES (1,'tpickavance0@amazon.co.uk','1234',1,1,1,1,1),(2,'dantham1@harvard.edu','SL4xbmOjiy',2,2,2,2,2),(3,'hdewdeny2@cbc.ca','23ODlQd7G9x',3,2,3,3,3),(4,'atolomio3@geocities.jp','IlPAtO7',4,2,4,4,4),(5,'sgeraldez4@mit.edu','cDnj1Tfv',5,2,5,5,5),(6,'mgroundwater5@vkontakte.ru','S81J6H2n2tgX',6,2,6,6,6),(7,'ccarde6@huffingtonpost.com','ZMJZKN9O0p',7,2,7,7,7),(8,'mtempest7@nps.gov','Vq1G1DKgQr',8,2,8,8,8),(9,'ipauncefort8@twitpic.com','JxBY0uQ1uk',9,2,9,9,9),(10,'javines2403@gmail.com','1234',10,2,10,10,10);
/*!40000 ALTER TABLE `comuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education`
--

DROP TABLE IF EXISTS `education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education` (
  `EduID` int NOT NULL,
  `Degree` varchar(50) NOT NULL,
  `Institution` varchar(100) NOT NULL,
  `YearStart` int NOT NULL,
  `YearEnd` int NOT NULL,
  PRIMARY KEY (`EduID`),
  KEY `idxDegree` (`Degree`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education`
--

LOCK TABLES `education` WRITE;
/*!40000 ALTER TABLE `education` DISABLE KEYS */;
INSERT INTO `education` VALUES (1,'Riffpedia','Vidoo',1994,2010),(2,'Kwilith','Gigazoom',2002,2013),(3,'Brightbean','Tambee',1990,2005),(4,'Bluejam','Jabberstorm',1997,2002),(5,'Flashset','Tavu',1999,2000),(6,'Zoombox','Kanoodle',1991,2013),(7,'Twitterlist','Jayo',1986,2011),(8,'Centidel','Katz',1999,2003),(9,'Meemm','Pixope',1995,2010),(10,'Browsezoom','Gigabox',2001,2010);
/*!40000 ALTER TABLE `education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `ExpeID` int NOT NULL,
  `Company` varchar(50) NOT NULL,
  `JobTitle` varchar(50) NOT NULL,
  `JobDescription` varchar(500) DEFAULT NULL,
  `LengthOfService` int NOT NULL,
  PRIMARY KEY (`ExpeID`),
  KEY `idxCompany` (`Company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,'Jabbercube','Internal Auditor','Oth fracture of right great toe, subs for fx w malunion',2),(2,'Yoveo','Desktop Support Technician','Antirheumatics, not elsewhere classified',1),(3,'Skinix','Civil Engineer','NIHSS score 5',7),(4,'Avamm','Social Worker','Corros 3rd deg mu site of l shldr/up lmb, ex wrs/hnd, subs',3),(5,'Oyoloo','Pharmacist','Dislocation of T5/T6 thoracic vertebra',6),(6,'Browseblab','Sales Representative','Corrosion of unsp degree of unsp toe(s) (nail), sequela',5),(7,'Edgeblab','Internal Auditor','Disp fx of capitate bone, left wrist, subs for fx w malunion',7),(8,'Quire','Information Systems Manager','Other specified rheumatoid arthritis, right wrist',4),(9,'Pixope','Project Manager','Malignant neoplasm of right cornea',5),(10,'Mydo','VP Accounting','Nondisp fx of med phalanx of l rng fngr, 7thD',6),(11,'1','Internal Auditor','Oth fracture of right great toe, subs for fx w malunion',2),(12,'1','Internal Auditor','Oth fracture of right great toe, subs for fx w malunion',2),(13,'1','Internal Auditor','Oth fracture of right great toe, subs for fx w malunion',2),(14,'1','Internal Auditor','Oth fracture of right great toe, subs for fx w malunion',2);
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `JobID` int NOT NULL,
  `JobType` varchar(50) NOT NULL,
  `ApplyDate` varchar(50) NOT NULL,
  `JobTitle` varchar(50) NOT NULL,
  `JobDes` varchar(300) NOT NULL,
  `PostDate` varchar(50) NOT NULL,
  `WorkPType` varchar(200) NOT NULL,
  `JobLoc` varchar(100) NOT NULL,
  PRIMARY KEY (`JobID`),
  KEY `idxJobLoc` (`JobLoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Opn wnd tongue/mouth flr','9/25/2022','Marketing Assistant','Reattachment of Right Shoulder Muscle, Open Approach','1/22/2022','Nondisp longitud fx unsp patella, 7thJ','1 Forest Dale Road'),(2,'Acq esophag diverticulum','9/2/2022','Occupational Therapist','Excision of Right Fallopian Tube, Percutaneous Endoscopic Approach','12/28/2021','Insect bite (nonvenomous) of left front wall of thorax','071 Pond Court'),(3,'Oth spf gstrt w/o hmrhg','11/7/2021','Design Engineer','Release Left Sternoclavicular Joint, Percutaneous Approach','2/3/2022','Penetrating wound of orbit w or w/o fb, unsp eye, init','055 Manitowish Terrace'),(4,'Miliary TB NOS-exam unkn','3/15/2022','Financial Advisor','Restriction of Right Upper Lobe Bronchus with Extraluminal Device, Percutaneous Approach','6/29/2022','Prsn outsd 3-whl mv inj in clsn w statnry obj nontraf, sqla','83 Meadow Valley Point'),(5,'TB pneumothorax-unspec','3/31/2022','Account Coordinator','Restriction of Left External Carotid Artery with Extraluminal Device, Percutaneous Endoscopic Approach','11/8/2021','Osteoarthritis of first carpometacarpal joint, unspecified','133 Sunfield Circle'),(6,'Actinic keratosis','12/25/2021','Structural Analysis Engineer','Transfer Right Foot Muscle, Percutaneous Endoscopic Approach','6/25/2022','Malignant melanoma of other and unspecified parts of face','7232 Utah Trail'),(7,'Iridoschisis','8/10/2022','Budget/Accounting Analyst II','Dilation of Right Greater Saphenous Vein, Percutaneous Approach','9/5/2022','Unsp inj musc/fasc/tend at shldr/up arm, left arm, init','629 Moose Trail'),(8,'One eye-mod/oth normal','3/20/2022','Human Resources Assistant IV','Reposition Left Metacarpal with External Fixation Device, Percutaneous Approach','2/1/2022','Oth fx shaft of rad, r arm, 7thF','503 Golden Leaf Point'),(9,'Consln ot sex trnsmt dis','11/23/2021','Engineer IV','Compression of Right Lower Leg using Intermittent Pressure Device','10/26/2021','Migraine without aura, intractable','2 Sugar Lane'),(10,'Thlassemia Hb-S w crisis','12/3/2021','Community Outreach Specialist','Replacement of Back Subcutaneous Tissue and Fascia with Nonautologous Tissue Substitute, Open Approach','12/24/2021','Unsp fx lower end of left femur, init for opn fx type 3A/B/C','81960 Lerdahl Alley');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `MesID` int NOT NULL,
  `MesCont` varchar(1000) NOT NULL,
  `SentDate` varchar(50) NOT NULL,
  `SeenDate` varchar(50) NOT NULL,
  PRIMARY KEY (`MesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Burkitt\'s tumor axilla','2/6/2022','12/11/2021'),(2,'Biliary tract injury-opn','5/29/2022','1/25/2022'),(3,'Pilates','9/14/2022','5/6/2022'),(4,'T7-t12 fx-cl/ant crd syn','5/15/2022','6/22/2022'),(5,'Contusion of forearm','8/10/2022','6/25/2022'),(6,'Renal osteodystrophy','4/20/2022','4/14/2022'),(7,'Carbuncle of leg','9/6/2022','7/13/2022'),(8,'Genital organ anom NOS','3/7/2022','2/25/2022'),(9,'Puerp endometritis-unsp','9/13/2022','11/14/2021'),(10,'Hx vulvar dysplasia','7/15/2022','7/10/2022');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relmesread`
--

DROP TABLE IF EXISTS `relmesread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relmesread` (
  `UserID` int NOT NULL,
  `MesID` int NOT NULL,
  PRIMARY KEY (`UserID`,`MesID`),
  KEY `MesID` (`MesID`),
  CONSTRAINT `relmesread_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `comuser` (`UserID`),
  CONSTRAINT `relmesread_ibfk_2` FOREIGN KEY (`MesID`) REFERENCES `message` (`MesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relmesread`
--

LOCK TABLES `relmesread` WRITE;
/*!40000 ALTER TABLE `relmesread` DISABLE KEYS */;
/*!40000 ALTER TABLE `relmesread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relthread`
--

DROP TABLE IF EXISTS `relthread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relthread` (
  `UserID` int NOT NULL,
  `ThreadID` int NOT NULL,
  PRIMARY KEY (`UserID`,`ThreadID`),
  KEY `ThreadID` (`ThreadID`),
  CONSTRAINT `relthread_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `comuser` (`UserID`),
  CONSTRAINT `relthread_ibfk_2` FOREIGN KEY (`ThreadID`) REFERENCES `thread` (`ThreadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relthread`
--

LOCK TABLES `relthread` WRITE;
/*!40000 ALTER TABLE `relthread` DISABLE KEYS */;
/*!40000 ALTER TABLE `relthread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relto`
--

DROP TABLE IF EXISTS `relto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relto` (
  `BulkID` int NOT NULL,
  `SubID` int NOT NULL,
  PRIMARY KEY (`BulkID`,`SubID`),
  KEY `SubID` (`SubID`),
  CONSTRAINT `relto_ibfk_1` FOREIGN KEY (`BulkID`) REFERENCES `bulkemail` (`BulkID`),
  CONSTRAINT `relto_ibfk_2` FOREIGN KEY (`SubID`) REFERENCES `subscribers` (`SubID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relto`
--

LOCK TABLES `relto` WRITE;
/*!40000 ALTER TABLE `relto` DISABLE KEYS */;
/*!40000 ALTER TABLE `relto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `Reply_ID` int NOT NULL,
  `RepContent` varchar(300) NOT NULL,
  `RepDate` varchar(50) NOT NULL,
  PRIMARY KEY (`Reply_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,'Other generalized epilepsy and epileptic syndromes, not intractable, with status epilepticus','11/21/2021'),(2,'Poisoning by unspecified general anesthetics, assault','7/31/2022'),(3,'Intervertebral disc stenosis of neural canal of cervical region','4/25/2022'),(4,'Other complications of procedures, not elsewhere classified, initial encounter','1/27/2022'),(5,'Phlebitis and thrombophlebitis of tibial vein','3/22/2022'),(6,'Poisoning by other fibrinolysis-affecting drugs, intentional self-harm','12/1/2021'),(7,'Fracture of unspecified part of neck of unspecified femur, subsequent encounter for closed fracture with delayed healing','11/2/2021'),(8,'Salter-Harris Type IV physeal fracture of left metatarsal, sequela','10/31/2021'),(9,'Displaced comminuted fracture of shaft of radius, right arm, initial encounter for open fracture type I or II','12/12/2021'),(10,'Laceration of other muscle(s) and tendon(s) of posterior muscle group at lower leg level, left leg, initial encounter','11/4/2021');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search` (
  `ProfileID` int NOT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`ProfileID`,`UserID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `search_ibfk_1` FOREIGN KEY (`ProfileID`) REFERENCES `userprofile` (`ProfileID`),
  CONSTRAINT `search_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `comuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers` (
  `SubID` int NOT NULL,
  `SubFName` varchar(50) NOT NULL,
  `SubLName` varchar(50) NOT NULL,
  `SubEmail` varchar(50) NOT NULL,
  PRIMARY KEY (`SubID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES (1,'Audrey','Merricks','amerricks0@wikispaces.com'),(2,'Codi','Dolman','cdolman1@pen.io'),(3,'Laural','Gonthier','lgonthier2@slashdot.org'),(4,'Felic','Tunmore','ftunmore3@europa.eu'),(5,'Becca','D\'Alesio','bdalesio4@google.com'),(6,'Maddie','McLese','mmclese5@goo.gl'),(7,'Yurik','Thomasset','ythomasset6@privacy.gov.au'),(8,'Darius','Goodridge','dgoodridge7@1und1.de'),(9,'Marrissa','Piddlehinton','mpiddlehinton8@cisco.com'),(10,'Lanie','Rooksby','lrooksby9@vk.com');
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thread` (
  `ThreadID` int NOT NULL,
  `ThContent` varchar(300) NOT NULL,
  `ThDate` varchar(50) NOT NULL,
  `CommentID` int NOT NULL,
  PRIMARY KEY (`ThreadID`),
  KEY `CommentID` (`CommentID`),
  CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`CommentID`) REFERENCES `usercomment` (`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (1,'Brain injury NEC','7/1/2022',1),(2,'Rhinoscleroma','5/28/2022',2),(3,'Pois-arsenic anti-infec','3/30/2022',3),(4,'Bronchus injury-closed','4/9/2022',4),(5,'FB in anterior chamber','2/11/2022',5),(6,'Protozoal intest dis NOS','8/28/2022',6),(7,'Dysenter arthrit NEC','10/18/2022',7),(8,'Hemarthrosis-l/leg','3/31/2022',8),(9,'Prim TB pleuris-histo dx','1/19/2022',9),(10,'Vocal cord/larynx polyp','7/9/2022',10);
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercomment`
--

DROP TABLE IF EXISTS `usercomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercomment` (
  `CommentID` int NOT NULL,
  `ComDate` varchar(50) NOT NULL,
  `ComContent` varchar(300) NOT NULL,
  `Reply_ID` int NOT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `Reply_ID` (`Reply_ID`),
  CONSTRAINT `usercomment_ibfk_1` FOREIGN KEY (`Reply_ID`) REFERENCES `reply` (`Reply_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercomment`
--

LOCK TABLES `usercomment` WRITE;
/*!40000 ALTER TABLE `usercomment` DISABLE KEYS */;
INSERT INTO `usercomment` VALUES (1,'7/6/2022','Partial physeal arrest, right distal radius',1),(2,'2/25/2022','Greenstick fracture of shaft of radius, left arm, init',2),(3,'12/21/2021','Activity, ironing',3),(4,'7/11/2022','Oth traum displ spondylolysis of second cervcal vert, sqla',4),(5,'12/9/2021','Disorders of male genital organs in diseases classd elswhr',5),(6,'9/10/2022','Displ seg fx shaft of humer, unsp arm, 7thG',6),(7,'6/25/2022','Toxic effect of hydrogen sulfide, intentional self-harm',7),(8,'5/29/2022','Corrosion of second degree of left knee, subs encntr',8),(9,'12/28/2021','Disp fx of lateral epicondyl of l humer, 7thK',9),(10,'3/18/2022','Unspecified physeal fracture of unspecified metatarsal, 7thK',10);
/*!40000 ALTER TABLE `usercomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofile`
--

DROP TABLE IF EXISTS `userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userprofile` (
  `ProfileID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `BirthDate` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `ExpeID` int NOT NULL,
  `EduID` int NOT NULL,
  PRIMARY KEY (`ProfileID`),
  KEY `ExpeID` (`ExpeID`),
  KEY `EduID` (`EduID`),
  KEY `idxProfile` (`ProfileID`),
  CONSTRAINT `userprofile_ibfk_1` FOREIGN KEY (`ExpeID`) REFERENCES `experience` (`ExpeID`),
  CONSTRAINT `userprofile_ibfk_2` FOREIGN KEY (`EduID`) REFERENCES `education` (`EduID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile`
--

LOCK TABLES `userprofile` WRITE;
/*!40000 ALTER TABLE `userprofile` DISABLE KEYS */;
INSERT INTO `userprofile` VALUES (1,'Ernest','Hansod','5/13/2022','Sweden','Stockholm',1,1),(2,'Maurise','Irce','5/3/2022','Brazil','Santana do Ipanema',2,2),(3,'Arin','Stait','3/14/2022','China','Jiangwang',3,3),(4,'Hildegarde','Ogley','10/23/2022','Kazakhstan','Kentau',4,4),(5,'Morena','Zmitruk','3/17/2022','Indonesia','Gunungputri',5,5),(6,'Gertrude','Timbrell','9/16/2022','Philippines','Kulase',6,6),(7,'Shaina','Tregien','11/10/2021','Democratic Republic of the Congo','Bondo',7,7),(8,'Deloria','Rudyard','9/6/2022','Portugal','Pegões',8,8),(9,'Abey','Vidgen','7/20/2022','Russia','Pravda',9,9),(10,'Jennifer','Martusov','8/3/2022','Indonesia','Kotes',10,10),(11,'Carmelle','Pencot','11/25/2021','Peru','Coalaque',1,1),(12,'Olenolin','Flude','1/22/2022','Russia','Sibay',2,2),(13,'Violet','Readhead','7/23/2022','Czech Republic','Podolí',3,3),(14,'Ellynn','Goldsmith','4/1/2022','Laos','Mounlapamôk',4,4),(15,'Pepe','Kasman','3/11/2022','France','Moret-sur-Loing',5,5),(16,'Bibi','Duffree','8/17/2022','China','Taiyanghe',6,6),(17,'Allyson','Ravenscraft','11/7/2021','France','Port-de-Bouc',7,7),(18,'Edee','Longhorne','3/22/2022','Japan','Onomichi',8,8),(19,'Sophi','Dobbson','7/14/2022','China','Pingli',9,9),(20,'Zebadiah','Martini','7/28/2022','Croatia','Jakšić',10,10),(21,'Ernest','Hansod','5/13/2022','Sweden','Stockholm',1,1);
/*!40000 ALTER TABLE `userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrole` (
  `RoleID` int NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `RoleDes` varchar(300) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,'Admin','Manages all the users and important company task'),(2,'User','Uses the Community Portal');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userview`
--

DROP TABLE IF EXISTS `userview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userview` (
  `ProfileID` int NOT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`ProfileID`,`UserID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `userview_ibfk_1` FOREIGN KEY (`ProfileID`) REFERENCES `userprofile` (`ProfileID`),
  CONSTRAINT `userview_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `comuser` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userview`
--

LOCK TABLES `userview` WRITE;
/*!40000 ALTER TABLE `userview` DISABLE KEYS */;
/*!40000 ALTER TABLE `userview` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-28 17:30:33
