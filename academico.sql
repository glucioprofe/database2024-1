CREATE TABLE facultad (
    id integer unsigned primary key auto_increment,
    nombre varchar(100) unique,
    codigo varchar(4) unique
);
 
CREATE TABLE programa (
    id integer unsigned primary key auto_increment,
    nombre varchar(100) unique,
    sigla varchar(4) unique,
    codigo varchar(4) unique,
    idfacultad integer unsigned,
    FOREIGN KEY (idfacultad) REFERENCES facultad(id)
);

CREATE TABLE asignatura (
    id integer unsigned primary key auto_increment,
    nombre varchar(100),
    creditos TINYINT,
    codigo varchar(5) unique,
    horas TINYINT
);

CREATE TABLE malla (
    id integer unsigned primary key auto_increment,
    idasignatura integer unsigned,
    idprograma integer unsigned,
    semestre TINYINT,
    FOREIGN KEY (idasignatura) REFERENCES asignatura(id),
    FOREIGN KEY (idprograma) REFERENCES programa(id),
    UNIQUE (idasignatura, idprograma)
);

CREATE TABLE estudiante (
    id integer unsigned primary key auto_increment,
    nombres varchar(100),
    documento varchar(15),
    codigo varchar(12) unique,
    jornada varchar(3)
);

CREATE TABLE matricula (
    id integer unsigned primary key auto_increment,
    fechamatricula date,
    idmalla integer unsigned,
    idestudiante integer unsigned,
    FOREIGN KEY (idmalla) REFERENCES malla(id),
    FOREIGN KEY (idestudiante) REFERENCES estudiante(id)
);

SELECT facultad.nombre, programa.nombre
FROM facultad
JOIN programa ON facultad.id = programa.idfacultad AND idfacultad=4

SELECT facultad.nombre, COUNT(programa.id)
FROM facultad
JOIN programa ON facultad.id = programa.idfacultad
GROUP BY(facultad.id);

//COUNT AVG SUM
//MAX MIN 

SELECT COUNT(id) FROM facultad;

SELECT MAX(facultad.id) FROM facultad;

SELECT facultad.id FROM facultad ORDER BY id desc LIMIT 1;

SELECT facultad.nombre, COUNT(programa.id)
FROM facultad
LEFT JOIN programa ON facultad.id = programa.idfacultad
GROUP BY(facultad.id);

Muestre el nombre de la facultad, el nombre del programa y el numero de asignaturas que tiene cada programa. Incluya los programas que no tienen asignaturas.


SELECT facultad.nombre, programa.nombre, COUNT(asignatura.id)
FROM  facultad
JOIN programa ON facultad.id = programa.idfacultad
LEFT JOIN malla ON programa.id = malla.idprograma
LEFT JOIN asignatura ON malla.idasignatura= asignatura.id
GROUP BY facultad.id, programa.id;


SELECT facultad.nombre, programa.nombre, COUNT (programa.id)
FROM facultad
LEFT JOIN programa  ON asignatura.id= asignatura.id
LEFT JOIN asignatura ON programa.id = asignatura.id

GROUP by(facultad.id, asignatura.id);

SELECT programa.nombre, AVG(asignatura.creditos)
FROM programa
JOIN malla ON malla.idprograma = programa.id
JOIN asignatura ON malla.idasignatura = asignatura.id
GROUP BY programa.id LIMIT 10;

CREATE VIEW vw_creditos AS
SELECT programa.nombre AS programa, AVG(asignatura.creditos) AS promedio
FROM programa
JOIN malla ON malla.idprograma = programa.id
JOIN asignatura ON malla.idasignatura = asignatura.id
GROUP BY programa.id LIMIT 10;

UPDATE programa SET nombre="Contaduria" WHERE nombre='Shanahan-Stehr';

CREATE VIEW vw_programa AS
SELECT asignatura.nombre as asignatura, programa.nombre as programa
from asignatura
join malla on asignatura.id = malla.idasignatura
join programa on malla.idprograma = programa.id
order by asignatura.nombre;

SELECT * FROM vw_programa WHERE programa LIKE '%Des';

INSERT INTO `facultad` VALUES (1,'Orn-Hermann','qt58'),(2,'Gutmann Group','mh78'),(3,'Stark PLC','ns86'),(4,'Ingenieria','ar50'),(5,'Mitchell, Hettinger and Strosin','fw74'),(6,'Yost PLC','ul37'),(7,'Spinka-Spencer','yy10'),(8,'Greenholt PLC','ll43'),(9,'Sawayn-Miller','xg76'),(10,'Stark and Sons','dk24');
INSERT INTO `programa` VALUES (1,'Contaduria','upyx','7151',5),(2,'T Desarrollo SW','eczm','6390',4),(3,'Tillman and Sons','qyke','0910',9),(4,'Stiedemann Group','nkwm','8876',9),(5,'Koepp, Barton and Schmitt','nllg','3723',9),(6,'Thompson, Kertzmann and Collier','znyq','0225',10),(7,'Eichmann Group','dpif','4556',5),(8,'Champlin and Sons','dkmn','1307',4),(9,'Wisozk, Schmitt and Tillman','wdvs','1566',1),(10,'Eichmann-O\'Connell','neof','0684',7),(11,'Zemlak, Jakubowski and Jerde','kjne','9563',9),(12,'Heaney Group','iwbk','1490',9),(13,'Kuhlman-Gorczany','noex','0170',5),(14,'Wunsch, Marks and Leuschke','lxwr','6932',10),(15,'Schulist Inc','pnqy','7234',8),(16,'Smith, Ferry and Terry','tmyl','9934',3),(17,'Stracke, Kulas and Swaniawski','kkxs','0519',7),(18,'O\'Keefe, Marvin and Green','nppl','5375',9),(19,'Hirthe-Hackett','cwyu','7836',6),(20,'Gaylord, Leffler and Nolan','nawm','6757',10);
INSERT INTO `asignatura` VALUES (1,'repellendus perspiciatis consequatur',1,'400wr',39),(2,'tempora sunt hic',3,'692wb',17),(3,'minus expedita facilis',6,'606cw',38),(4,'magnam id aut',8,'574gf',64),(5,'est vel et',2,'262sk',27),(6,'occaecati cupiditate rerum',7,'752bq',28),(7,'officia tempore possimus',5,'779sf',19),(8,'qui commodi iure',9,'016kv',26),(9,'eos aliquam sed',1,'670mw',18),(10,'aliquam praesentium mollitia',4,'541fn',42),(11,'voluptatem veniam tenetur',4,'278bb',23),(12,'ex nam ut',5,'921fe',24),(13,'consequatur ex eveniet',10,'962oa',61),(14,'adipisci aut vitae',6,'276dt',57),(15,'laboriosam incidunt quod',5,'836mc',63),(16,'quos ex fugiat',10,'204he',53),(17,'fugiat ipsum nam',10,'800ti',48),(18,'rerum laudantium sed',1,'350yd',29),(19,'asperiores libero vero',9,'538ot',38),(20,'laudantium animi nam',9,'536yc',48),(21,'nihil iure et',10,'471at',44),(22,'error incidunt amet',6,'670oy',63),(23,'ut laborum quasi',7,'331xo',35),(24,'nesciunt magni exercitationem',2,'078zs',60),(25,'voluptas sit minima',5,'876zw',25),(26,'consequatur placeat perferendis',8,'355dn',47),(27,'maiores in nemo',1,'234jh',24),(28,'recusandae et et',6,'353iv',63),(29,'aut aut quas',8,'176hc',43),(30,'recusandae quis quaerat',5,'262ro',27),(31,'mollitia consequatur aut',1,'362dm',40),(32,'ut ut voluptate',9,'419rw',33),(33,'omnis ut facere',2,'024np',40),(34,'adipisci eum aliquid',4,'209wi',53),(35,'quia quasi rem',6,'860mp',50),(36,'corrupti et dolorum',8,'133pg',51),(37,'velit dignissimos doloremque',6,'487dt',45),(38,'quod sint soluta',9,'827eo',25),(39,'maiores quo earum',9,'050hx',55),(40,'deserunt vel est',9,'948ac',59),(41,'ea ratione soluta',10,'759ve',46),(42,'modi ab et',10,'111fg',22),(43,'iure voluptatem odit',1,'172wg',31),(44,'quis illo velit',3,'470bs',53),(45,'consequatur vero occaecati',3,'643xv',34),(46,'deserunt eaque et',9,'635es',41),(47,'asperiores dolorem et',1,'241bq',19),(48,'ex molestias aut',9,'479qs',44),(49,'quae cumque totam',2,'888go',58),(50,'a sunt delectus',2,'082lk',29),(51,'ipsum quia quia',6,'621bb',60),(52,'eaque consectetur omnis',6,'611wv',47),(53,'sed quisquam cumque',7,'580gx',58),(54,'voluptatum sequi deleniti',7,'179up',52),(55,'explicabo eaque adipisci',3,'828op',64),(56,'aliquam ipsa occaecati',5,'632gu',44),(57,'ipsam cumque labore',10,'939og',24),(58,'blanditiis esse sint',5,'427le',19),(59,'consequatur aliquam perferendis',9,'505lx',35),(60,'quisquam sit natus',4,'439at',20),(61,'et corporis tenetur',7,'684oi',37),(62,'quis suscipit earum',5,'034ag',30),(63,'optio ab maiores',4,'071cu',63),(64,'qui eos quis',7,'133js',16),(65,'et quia qui',1,'607vj',29),(66,'aut adipisci quas',9,'077gh',17),(67,'exercitationem rem enim',6,'165gr',60),(68,'quidem occaecati deleniti',10,'950pj',33),(69,'accusantium aspernatur aut',9,'535zn',45),(70,'ut enim et',3,'927fx',24),(71,'sed consectetur unde',3,'406vt',54),(72,'non esse enim',5,'072zz',53),(73,'aut dignissimos nihil',9,'359ig',39),(74,'et qui ut',2,'743qv',61),(75,'ex nisi dolor',1,'566lt',30),(76,'vel quam quia',7,'606dh',41),(77,'itaque ad sed',1,'603ba',39),(78,'qui beatae est',3,'024tj',42),(79,'repellat aut aut',1,'357xt',50),(80,'sed neque hic',5,'437we',17),(81,'corporis nam aut',1,'614hw',38),(82,'consequuntur eum voluptas',5,'648py',17),(83,'perspiciatis fugiat possimus',9,'808xx',47),(84,'perspiciatis nisi voluptatem',8,'602md',34),(85,'ea accusamus consequatur',7,'866nb',30),(86,'omnis facilis fugit',5,'355fd',42),(87,'fuga quo dolore',2,'036kh',21),(88,'iusto dolores perspiciatis',10,'083gg',36),(89,'in non totam',8,'601qn',44),(90,'et recusandae illo',8,'484ba',19),(91,'velit in sed',8,'352gw',36),(92,'mollitia hic hic',10,'751la',26),(93,'ipsam adipisci sequi',2,'921pp',22),(94,'temporibus doloribus eius',8,'957zk',55),(95,'eos rem eligendi',5,'594vm',30),(96,'tenetur accusantium ratione',2,'884ak',48),(97,'unde eius sit',6,'947sa',51),(98,'voluptatum quis sapiente',4,'041bs',17),(99,'sint aliquam natus',9,'948ag',37),(100,'non natus quos',1,'904bb',64),(101,'minus adipisci sunt',7,'033kb',52),(102,'quo odio qui',2,'838xq',54),(103,'veritatis qui sed',1,'932sz',46),(104,'est laborum aut',6,'480gm',24),(105,'et blanditiis expedita',8,'746xo',21),(106,'dolores minus veniam',2,'748cw',24),(107,'eligendi iusto tempora',10,'898os',30),(108,'sit iure porro',7,'950ba',28),(109,'velit magnam consequuntur',2,'075ro',47),(110,'fuga dolorem consequatur',7,'315bc',58),(111,'doloremque incidunt aliquid',8,'905ta',64),(112,'qui ab voluptate',8,'139wt',62),(113,'deserunt eaque voluptatem',1,'147fi',52),(114,'nam ab est',7,'400uc',30),(115,'aliquam laboriosam fugiat',5,'234ka',56),(116,'incidunt velit fugiat',5,'029ar',19),(117,'possimus doloremque qui',10,'900hw',19),(118,'rerum quos magni',8,'827yx',39),(119,'et excepturi omnis',6,'044ju',16),(120,'iusto ad distinctio',10,'233wg',25),(121,'facilis omnis minima',3,'551az',16),(122,'facilis itaque earum',7,'772sz',64),(123,'et eius deserunt',2,'859ms',59),(124,'qui eveniet neque',10,'811iu',19),(125,'officiis neque quo',5,'124qi',20),(126,'provident excepturi eligendi',5,'464zd',49),(127,'recusandae ut libero',1,'549pl',31),(128,'eum accusantium iste',4,'833ii',62),(129,'fugit velit ut',6,'143ne',47),(130,'fugit reiciendis rerum',8,'059qg',23),(131,'eos accusamus sit',6,'959cj',57),(132,'earum ut ad',7,'737xb',61),(133,'dicta eius ipsum',7,'244kd',61),(134,'quia quo ratione',5,'638vp',32),(135,'non enim et',2,'916ul',36),(136,'quaerat autem quod',4,'492se',41),(137,'ut iure corporis',10,'743ig',49),(138,'dolor similique distinctio',3,'107di',46),(139,'est nihil eveniet',5,'557ra',28),(140,'tenetur laudantium consequatur',4,'893pf',56),(141,'magni est similique',10,'398mb',23),(142,'quia doloribus itaque',8,'082ya',49),(143,'qui minus quisquam',8,'641lx',38),(144,'facilis expedita fugit',7,'265vt',44),(145,'sunt consequuntur quod',8,'117it',50),(146,'voluptatem saepe veniam',9,'124qk',29),(147,'nemo ea quo',5,'463nl',18),(148,'aliquid ut earum',4,'236hn',41),(149,'voluptate dignissimos aut',10,'296ej',36),(150,'qui consequatur voluptatem',5,'671ro',49),(151,'sequi est sint',1,'674rd',54),(152,'repellat exercitationem harum',1,'719hl',41),(153,'consequatur deleniti et',4,'955lf',23),(154,'molestiae explicabo ratione',8,'492ct',47),(155,'distinctio perferendis quo',4,'787ed',44),(156,'officiis eos eaque',8,'795qe',58),(157,'maiores perferendis est',3,'482yq',33),(158,'accusantium corrupti possimus',2,'464bs',24),(159,'maiores quisquam qui',3,'649fz',34),(160,'quos rerum itaque',2,'082pf',48);

INSERT INTO `malla` VALUES (1,6,95,20),(2,7,124,15),(3,3,20,1),(4,2,124,16),(5,6,14,6),(6,6,71,12),(7,4,139,20),(8,9,71,12),(9,9,157,20),(10,8,116,11),(11,3,150,19),(12,1,102,5),(13,10,44,16),(14,3,108,15),(15,5,116,6),(16,1,138,20),(17,7,103,2),(18,8,71,11),(19,1,100,10),(20,10,110,3),(21,10,112,16),(22,7,10,6),(23,4,56,13),(24,5,10,8),(25,9,9,8),(26,6,134,3),(27,7,116,1),(28,7,35,9),(29,2,125,10),(30,1,71,17),(31,5,55,20),(32,2,45,8),(33,2,104,3),(34,5,25,20),(35,3,135,13),(36,10,48,19),(37,4,104,19),(38,8,129,16),(39,9,86,14),(40,3,68,2),(41,7,141,14),(42,1,82,5),(43,6,97,4),(44,5,12,19),(45,5,81,10),(46,1,156,16),(47,2,111,18),(48,3,112,13),(49,9,152,18),(50,2,89,8),(51,10,14,3),(52,2,28,5),(53,4,128,12),(54,6,20,10),(55,6,15,11),(56,2,18,16),(57,8,19,18),(58,6,129,15),(59,3,127,15),(60,4,93,9),(61,9,136,2),(62,5,144,2),(63,8,30,17),(64,10,26,4),(65,8,154,3),(66,9,54,6),(67,2,60,18),(68,2,114,11),(69,9,95,4),(70,10,41,16),(71,5,154,13),(72,7,86,13),(73,4,78,6),(74,6,14,3),(75,2,11,10),(76,2,109,1),(77,9,32,6),(78,6,34,1),(79,5,128,19),(80,8,123,5),(81,9,85,20),(82,7,107,18),(83,3,145,11),(84,4,33,18),(85,9,91,11),(86,2,133,4),(87,7,21,5),(88,10,157,11),(89,4,131,15),(90,9,101,6),(91,1,38,3),(92,9,74,11),(93,8,42,18),(94,8,75,20),(95,2,73,20),(96,3,85,10),(97,7,112,4),(98,8,116,7),(99,5,78,16),(100,10,131,17),(101,9,12,1),(102,3,106,18),(103,1,108,13),(104,1,153,15),(105,9,124,17),(106,1,24,2),(107,9,149,13),(108,7,3,4),(109,3,93,8),(110,10,25,20),(111,1,119,11),(112,3,88,3),(113,2,69,11),(114,5,38,11),(115,3,82,9),(116,5,27,5),(117,7,68,3),(118,2,108,12),(119,8,130,8),(120,5,96,8),(121,4,134,14),(122,2,140,4),(123,2,98,10),(124,7,50,12),(125,5,47,18),(126,2,123,20),(127,8,14,13),(128,10,18,20),(129,9,131,4),(130,1,104,4),(131,3,125,10),(132,10,102,6),(133,8,83,5),(134,1,45,10),(135,1,42,16),(136,2,117,6),(137,6,60,6),(138,1,1,7),(139,1,31,18),(140,5,26,19),(141,6,137,18),(142,10,2,8),(143,3,83,11),(144,8,98,1),(145,1,117,14),(146,3,94,18),(147,6,58,12),(148,6,129,11),(149,3,103,17),(150,3,121,15),(151,5,61,3),(152,1,128,5),(153,8,66,10),(154,8,97,4),(155,8,22,19),(156,5,37,14),(157,10,71,20),(158,5,124,10),(159,5,29,9),(160,4,110,17);


INSERT INTO `estudiante` VALUES (1,'Gonzalo Andres',2671580295,'EST12175'),(2,'Gonzalo Andres',6751843885,'EST96667'),(3,'Gonzalo Andres',4373580651,'EST37891'),(4,'Gonzalo Andres',7450139092,'EST13382'),(5,'Gonzalo Andres',2898239463,'EST75804'),(6,'Gonzalo Andres',6978239088,'EST40318'),(7,'Gonzalo Andres',6689829766,'EST84486'),(8,'Gonzalo Andres',4044489661,'EST61658'),(9,'Gonzalo Andres',7630076174,'EST65433'),(10,'Gonzalo Andres',7218082129,'EST48612'),(11,'Gonzalo Andres',7712216882,'EST26757'),(12,'Gonzalo Andres',216040338,'EST27296'),(13,'Gonzalo Andres',5576010693,'EST99648'),(14,'Gonzalo Andres',6235068798,'EST74747'),(15,'Gonzalo Andres',7890162028,'EST25906'),(16,'Gonzalo Andres',6540427321,'EST79422'),(17,'Gonzalo Andres',2957146489,'EST18504'),(18,'Gonzalo Andres',1273842949,'EST86830'),(19,'Gonzalo Andres',2720399270,'EST29047'),(20,'Gonzalo Andres',1602645054,'EST96126'),(21,'Gonzalo Andres',520580848,'EST99152'),(22,'Gonzalo Andres',3656829743,'EST39919'),(23,'Gonzalo Andres',3855390604,'EST94525'),(24,'Gonzalo Andres',9212135625,'EST63185'),(25,'Gonzalo Andres',5891050875,'EST72180'),(26,'Gonzalo Andres',6568346174,'EST14003'),(27,'Gonzalo Andres',1480585722,'EST53788'),(28,'Gonzalo Andres',2004111879,'EST83753'),(29,'Gonzalo Andres',5106545856,'EST46568'),(30,'Gonzalo Andres',7048053333,'EST47697'),(31,'Gonzalo Andres',242473286,'EST75677'),(32,'Gonzalo Andres',9642720525,'EST34754'),(33,'Gonzalo Andres',5228570613,'EST94820'),(34,'Gonzalo Andres',806268160,'EST26392'),(35,'Gonzalo Andres',5124149149,'EST81522'),(36,'Gonzalo Andres',5443367184,'EST66563'),(37,'Gonzalo Andres',2566375033,'EST72493'),(38,'Gonzalo Andres',5370253455,'EST65472'),(39,'Gonzalo Andres',3931651851,'EST28823'),(40,'Gonzalo Andres',9763866310,'EST16286');

INSERT INTO `matricula` VALUES (1,'2018-01-31',159,39),(2,'2006-03-13',38,12),(3,'2003-12-08',75,23),(4,'2019-12-16',24,14),(5,'2023-09-17',82,25),(6,'2018-04-13',151,39),(7,'2012-07-07',88,28),(8,'1998-11-05',56,21),(9,'2009-09-09',19,37),(10,'1978-02-03',20,7),(11,'2014-09-06',54,35),(12,'2004-12-18',79,20),(13,'1981-08-18',66,34),(14,'2019-11-08',91,26),(15,'1978-08-15',47,36),(16,'2011-07-13',67,20),(17,'2009-07-10',8,5),(18,'1971-10-24',147,40),(19,'2014-12-02',21,20),(20,'2014-05-18',11,14),(21,'2017-01-23',129,25),(22,'1997-08-08',130,35),(23,'1970-03-20',111,31),(24,'2010-02-02',82,31),(25,'2012-08-14',18,32),(26,'1986-12-07',52,2),(27,'1994-05-04',151,39),(28,'2015-10-14',157,9),(29,'2005-04-16',41,8),(30,'2003-05-04',74,3),(31,'2007-03-08',91,8),(32,'1982-11-05',96,12),(33,'1997-06-06',44,30),(34,'2002-07-24',145,15),(35,'1975-05-14',90,20),(36,'1974-06-26',57,18),(37,'2022-11-25',135,27),(38,'1980-01-19',63,35),(39,'1992-02-20',128,11),(40,'2014-01-31',124,10);
