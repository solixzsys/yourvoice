DROP TABLE IF EXISTS "app_poll";
CREATE TABLE "app_poll" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "poll_code" varchar(20) NOT NULL, "poll_title" varchar(50) NOT NULL, "poll_question" text NOT NULL, "poll_domain" varchar(20) NOT NULL, "poll_date" date NOT NULL, "poll_state" varchar(20) NOT NULL, "poll_author_id" integer NOT NULL REFERENCES "auth_user" ("id"), "poll_surveytag_id" integer NOT NULL REFERENCES "app_surveytag" ("id"));
INSERT INTO "app_poll" VALUES(1,'c1aa9e1b7e5ba34dd986c804070b2ea3','increase in intrest rate','<p>would the increase have good inpact on economy</p>','ECONOMY','2017-06-21','UNPUBLISH',1,1);
INSERT INTO "app_poll" VALUES(2,'0c4b65323bf94bd28a9b040142f239fa','log term effect of intrest rate','<p>what are the previous effect of intrest ra<span style="color:#800000">te increase</span></p>','ECONOMY','2017-06-21','UNPUBLISH',1,1);
DROP TABLE IF EXISTS "app_polloption";
CREATE TABLE "app_polloption" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "polloption_text" text NOT NULL, "polloption_questioncode" varchar(50) NOT NULL, "polloption_code" varchar(200) NOT NULL, "polloption_score" integer NOT NULL, "polloption_questiontitle" varchar(50) NOT NULL);
INSERT INTO "app_polloption" VALUES(1,'Yes, definately','c1aa9e1b7e5ba34dd986c804070b2ea3','4w11xl3TLMUMkq8MnvFflHcqX29LtlQQ',0,'increase in intrest rate');
INSERT INTO "app_polloption" VALUES(2,'may be','c1aa9e1b7e5ba34dd986c804070b2ea3','2ScLBi8PWCCVUo7B2pzbuYapI7u0ft1A',0,'increase in intrest rate');
INSERT INTO "app_polloption" VALUES(3,'Indefferent','c1aa9e1b7e5ba34dd986c804070b2ea3','ElTBBbEkD9gm6ee2lRoUkdK9e7Q7d37d',0,'increase in intrest rate');
INSERT INTO "app_polloption" VALUES(4,'no','c1aa9e1b7e5ba34dd986c804070b2ea3','IlenueXh4NpiHAb8sAEGvtdf8mOXSMFU',0,'increase in intrest rate');
INSERT INTO "app_polloption" VALUES(5,'fantastic','0c4b65323bf94bd28a9b040142f239fa','C4GINNPaBvqtTm0uWPIQs37jOsX6A6fM',0,'log term effect of intrest rate');
INSERT INTO "app_polloption" VALUES(6,'not bade','0c4b65323bf94bd28a9b040142f239fa','PuAu3dNVpIwbuajaZxFZJvpH2GmvyH0w',0,'log term effect of intrest rate');
DROP TABLE IF EXISTS "app_storyflatpage";
CREATE TABLE "app_storyflatpage" ("cmsflatpage_ptr_id" integer NOT NULL PRIMARY KEY REFERENCES "extended_flatpages_cmsflatpage" ("flatpage_ptr_id"), "story_is_hero" bool NOT NULL, "story_hero_image" varchar(100) NOT NULL, "story_domain" varchar(20) NOT NULL, "story_status" varchar(20) NOT NULL, "story_date" date NOT NULL);
INSERT INTO "app_storyflatpage" VALUES(7,1,'passport/2017/06/22/campaigns.engageya.com.591060bc64abb_131578_2.jpg','SOCIAL','DRAFT','2017-06-22');
INSERT INTO "app_storyflatpage" VALUES(9,1,'passport/2017/06/22/WORLD-BANK.jpg','ECONOMY','DRAFT','2017-06-22');
INSERT INTO "app_storyflatpage" VALUES(11,0,'passport/2017/06/23/placeholder.png','POLITICS','DRAFT','2017-06-22');
INSERT INTO "app_storyflatpage" VALUES(12,0,'passport/2017/06/23/placeholder_iSKqR7a.png','POLITICS','DRAFT','2017-06-22');
INSERT INTO "app_storyflatpage" VALUES(13,1,'passport/2017/06/23/DSS-operatives.jpg','SOCIAL','DRAFT','2017-06-23');
DROP TABLE IF EXISTS "app_surveytag";
CREATE TABLE "app_surveytag" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "surveytag_title" text NOT NULL, "surveytag_description" text NOT NULL, "surveytag_tag" varchar(100) NOT NULL, "surveytag_date" date NOT NULL, "surveytag_domain" varchar(20) NOT NULL, "surveytag_status" varchar(20) NOT NULL, "surveytag_owner_id" integer NOT NULL REFERENCES "auth_user" ("id"));
INSERT INTO "app_surveytag" VALUES(1,'increase in intrest rate','<p>the cbn just<strong> increase</strong> the intrest rate</p>','qVUb7SQBLRXcBJhlzomEtSx3Eb0oqEXS','2017-06-21','ECONOMY','DRAFT',1);
DROP TABLE IF EXISTS "auth_group";
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);
DROP TABLE IF EXISTS "auth_group_permissions";
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));
DROP TABLE IF EXISTS "auth_permission";
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO "auth_permission" VALUES(1,1,'add_polloption','Can add poll option');
INSERT INTO "auth_permission" VALUES(2,1,'change_polloption','Can change poll option');
INSERT INTO "auth_permission" VALUES(3,1,'delete_polloption','Can delete poll option');
INSERT INTO "auth_permission" VALUES(4,2,'add_poll','Can add poll');
INSERT INTO "auth_permission" VALUES(5,2,'change_poll','Can change poll');
INSERT INTO "auth_permission" VALUES(6,2,'delete_poll','Can delete poll');
INSERT INTO "auth_permission" VALUES(7,3,'add_surveytag','Can add survey tag');
INSERT INTO "auth_permission" VALUES(8,3,'change_surveytag','Can change survey tag');
INSERT INTO "auth_permission" VALUES(9,3,'delete_surveytag','Can delete survey tag');
INSERT INTO "auth_permission" VALUES(10,4,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES(11,4,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES(12,4,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES(13,5,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES(14,5,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES(15,5,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES(16,6,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(17,6,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(18,6,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(19,7,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES(20,7,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES(21,7,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES(22,8,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES(23,8,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES(24,8,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES(25,9,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES(26,9,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES(27,9,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES(28,10,'add_site','Can add site');
INSERT INTO "auth_permission" VALUES(29,10,'change_site','Can change site');
INSERT INTO "auth_permission" VALUES(30,10,'delete_site','Can delete site');
INSERT INTO "auth_permission" VALUES(31,11,'add_flatpage','Can add flat page');
INSERT INTO "auth_permission" VALUES(32,11,'change_flatpage','Can change flat page');
INSERT INTO "auth_permission" VALUES(33,11,'delete_flatpage','Can delete flat page');
INSERT INTO "auth_permission" VALUES(34,12,'add_cmsflatpage','Can add cms flat page');
INSERT INTO "auth_permission" VALUES(35,12,'change_cmsflatpage','Can change cms flat page');
INSERT INTO "auth_permission" VALUES(36,12,'delete_cmsflatpage','Can delete cms flat page');
INSERT INTO "auth_permission" VALUES(37,13,'add_storyflatpage','Can add story flat page');
INSERT INTO "auth_permission" VALUES(38,13,'change_storyflatpage','Can change story flat page');
INSERT INTO "auth_permission" VALUES(39,13,'delete_storyflatpage','Can delete story flat page');
DROP TABLE IF EXISTS "auth_user";
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "username" varchar(150) NOT NULL UNIQUE);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$36000$RVlZ2f28wAmO$X6Zo0ToMwPaQx7FjPBPPPLww4pk46i7vzSYAr4taayY=','2017-06-21 16:11:04.001702',1,'','','solixzsystem@gmail.com',1,1,'2017-06-21 10:21:48.221047','soliu');
DROP TABLE IF EXISTS "auth_user_groups";
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"));
DROP TABLE IF EXISTS "auth_user_user_permissions";
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));
DROP TABLE IF EXISTS "django_admin_log";
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "action_time" datetime NOT NULL);
INSERT INTO "django_admin_log" VALUES(1,'1','increase in intrest rate',1,'[{"added": {}}]',3,1,'2017-06-21 10:34:10.918241');
INSERT INTO "django_admin_log" VALUES(2,'1','increase in intrest rate',1,'[{"added": {}}]',2,1,'2017-06-21 10:35:02.917787');
INSERT INTO "django_admin_log" VALUES(3,'2','log term effect of intrest rate',1,'[{"added": {}}]',2,1,'2017-06-21 10:37:04.457420');
INSERT INTO "django_admin_log" VALUES(4,'1','/test1/ -- testing',1,'[{"added": {}}]',11,1,'2017-06-21 10:46:29.096389');
INSERT INTO "django_admin_log" VALUES(5,'1','/test1/ -- testing',3,'',11,1,'2017-06-21 10:51:06.179283');
INSERT INTO "django_admin_log" VALUES(6,'1','example.com',3,'',10,1,'2017-06-21 10:51:27.652801');
INSERT INTO "django_admin_log" VALUES(7,'2','localhost:8888',1,'[{"added": {}}]',10,1,'2017-06-21 10:51:42.328508');
INSERT INTO "django_admin_log" VALUES(8,'2','/test1/ -- testing',1,'[{"added": {}}]',11,1,'2017-06-21 10:52:32.267793');
INSERT INTO "django_admin_log" VALUES(9,'2','/pages/test1/ -- testing',2,'[{"changed": {"fields": ["url"]}}]',11,1,'2017-06-21 10:55:05.142136');
INSERT INTO "django_admin_log" VALUES(10,'2','/test1/ -- testing',2,'[{"changed": {"fields": ["url"]}}]',11,1,'2017-06-21 10:55:53.865076');
INSERT INTO "django_admin_log" VALUES(11,'3','/test3/ -- testing3',1,'[{"added": {}}]',12,1,'2017-06-21 13:49:19.791095');
INSERT INTO "django_admin_log" VALUES(12,'4','/test1/ -- testing 1',1,'[{"added": {}}]',12,1,'2017-06-21 15:52:57.325253');
INSERT INTO "django_admin_log" VALUES(13,'5','/test2/ -- testing2',1,'[{"added": {}}]',12,1,'2017-06-21 15:53:45.289549');
INSERT INTO "django_admin_log" VALUES(14,'6','/test3/ -- testing3',1,'[{"added": {}}]',12,1,'2017-06-21 15:54:27.079692');
INSERT INTO "django_admin_log" VALUES(15,'7','Lagos policeman allegedly caught extorting-money-with-POS-–-Punch Newspapers -- Lagos policeman allegedly caught extorting money with POS – Punch Newspapers',1,'[{"added": {}}]',13,1,'2017-06-22 12:11:05.434225');
INSERT INTO "django_admin_log" VALUES(16,'7','/Lagos-policeman-allegedly-caught-extorting-money-with-POS-–-Punch Newspapers/ -- Lagos policeman allegedly caught extorting money with POS – Punch Newspapers',2,'[{"changed": {"fields": ["url"]}}]',13,1,'2017-06-22 12:13:51.693118');
INSERT INTO "django_admin_log" VALUES(17,'8','6qkuRAzoYF8AnLaDmMrlyKJIMyddlh1l -- khj',1,'[{"added": {}}]',13,1,'2017-06-22 12:22:47.031777');
INSERT INTO "django_admin_log" VALUES(18,'8','6qkuRAzoYF8AnLaDmMrlyKJIMyddlh1l -- khj',3,'',13,1,'2017-06-22 12:25:25.853100');
INSERT INTO "django_admin_log" VALUES(19,'9','/W’Bank-approves-$961m-for-Nigeria’s-economic-recovery-plan/ -- W’Bank approves $961m for Nigeria’s economic recovery plan',1,'[{"added": {}}]',13,1,'2017-06-22 12:30:40.955595');
INSERT INTO "django_admin_log" VALUES(20,'10','/iuji-;i--uyu-k/ -- iuji ;i  uyu k',1,'[{"added": {}}]',13,1,'2017-06-22 12:32:03.885454');
INSERT INTO "django_admin_log" VALUES(21,'10','/iuji-;i--uyu-k/ -- iuji ;i  uyu k',3,'',13,1,'2017-06-22 12:32:39.748248');
INSERT INTO "django_admin_log" VALUES(22,'11','/We’ve-resolved-Nigeria-must-not-break,-say-governors/ -- We’ve resolved Nigeria must not break, say governors',1,'[{"added": {}}]',13,1,'2017-06-22 12:35:07.150668');
INSERT INTO "django_admin_log" VALUES(23,'12','/Wike-opposes-NLNG-Act-amendment/ -- Wike opposes NLNG Act amendment',1,'[{"added": {}}]',13,1,'2017-06-22 12:38:56.928840');
INSERT INTO "django_admin_log" VALUES(24,'11','/We’ve-resolved-Nigeria-must-not-break,-say-governors/ -- We’ve resolved Nigeria must not break, say governors',2,'[{"changed": {"fields": ["story_hero_image"]}}]',13,1,'2017-06-23 14:49:09.143098');
INSERT INTO "django_admin_log" VALUES(25,'12','/Wike-opposes-NLNG-Act-amendment/ -- Wike opposes NLNG Act amendment',2,'[{"changed": {"fields": ["story_hero_image"]}}]',13,1,'2017-06-23 14:49:29.799837');
INSERT INTO "django_admin_log" VALUES(26,'13','/Eid-el-Fitr:-DSS-uncovers-plan-to-bomb-praying-grounds/ -- Eid-el-Fitr: DSS uncovers plan to bomb praying grounds',1,'[{"added": {}}]',13,1,'2017-06-23 21:57:53.647796');
DROP TABLE IF EXISTS "django_content_type";
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO "django_content_type" VALUES(1,'app','polloption');
INSERT INTO "django_content_type" VALUES(2,'app','poll');
INSERT INTO "django_content_type" VALUES(3,'app','surveytag');
INSERT INTO "django_content_type" VALUES(4,'admin','logentry');
INSERT INTO "django_content_type" VALUES(5,'auth','user');
INSERT INTO "django_content_type" VALUES(6,'auth','permission');
INSERT INTO "django_content_type" VALUES(7,'auth','group');
INSERT INTO "django_content_type" VALUES(8,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(9,'sessions','session');
INSERT INTO "django_content_type" VALUES(10,'sites','site');
INSERT INTO "django_content_type" VALUES(11,'flatpages','flatpage');
INSERT INTO "django_content_type" VALUES(12,'extended_flatpages','cmsflatpage');
INSERT INTO "django_content_type" VALUES(13,'app','storyflatpage');
DROP TABLE IF EXISTS "django_flatpage";
CREATE TABLE "django_flatpage" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "url" varchar(100) NOT NULL, "title" varchar(200) NOT NULL, "content" text NOT NULL, "enable_comments" bool NOT NULL, "template_name" varchar(70) NOT NULL, "registration_required" bool NOT NULL);
INSERT INTO "django_flatpage" VALUES(4,'/test1/','testing 1','<p>testing1..............................</p>',1,'',0);
INSERT INTO "django_flatpage" VALUES(5,'/test2/','testing2','<p>testing 2 ............................</p>',1,'',0);
INSERT INTO "django_flatpage" VALUES(6,'/test3/','testing3','<p>testing3................................</p>',1,'',0);
INSERT INTO "django_flatpage" VALUES(7,'/Lagos-policeman-allegedly-caught-extorting-money-with-POS-–-Punch Newspapers/','Lagos policeman allegedly caught extorting money with POS – Punch Newspapers','<p>&nbsp;</p>

<p><strong>Samson Folarin</strong></p>

<p>&nbsp;THE Lagos State Police Command on Wednesday cleared a policeman attached to the Makinde Police Division of allegation of extortion.</p>

<p>A seven-second clip&nbsp; filmed by a female motorist had shown the policeman holding what looked like a Point of Sale terminal.</p>

<p>&nbsp;</p>

<p>He was seen taking what appeared like an Automated Teller Machine card from a man who had disembarked a motorcycle.</p>

<p>The woman who was filming the incident from her car was heard in the background accusing the policeman of extortion.</p>

<p>Efforts by our correspondent to speak with the woman were abortive, as the poster of the clip on&nbsp;<em>Instagram</em>&nbsp;said she sought anonymity.</p>

<p>&nbsp;The poster told&nbsp;<em>PUNCH Metro&nbsp;</em>that the witness was in her car when the incident happened.</p>

<p>&nbsp;After the video went viral on the social media, many Nigerians expressed shock and dismay at the attitude of the cop, which they said represented the level of corruption in the Nigeria Police Force.</p>

<p>&nbsp;Our correspondent visited Olowora Street, in the Mafoluku area of Oshodi, where the incident reportedly happened on Tuesday, June 20, 2017. He established the spot of the incident from the video evidence, but no resident owned up to witnessing&nbsp; the incident.</p>

<p>&nbsp;Instead, the residents, including motorcyclists and traders, lamented that policemen from the Makinde and Akinpelu divisions were notorious for extorting money from commercial motorcyclists in the area.</p>

<p>&nbsp;A trader close to the scene of the incident noted that policemen from the Makinde division sometime stayed at the junction to extort money from motorists and motorcycle riders.</p>

<p>&nbsp;A resident of the area said, &ldquo;Extortion by policemen is not new here.&nbsp; There is a woman selling roasted corn down the road. They stay close to her place. But I did not witness the one in the video.&rdquo;</p>

<p>&nbsp;An executive member of one of the motorcycle riders association in the community, who watched the video, said it was not impossible for the policemen to do such a thing.</p>

<p>&nbsp;He said, &ldquo;It is a normal occurrence around here. In fact, it happens on a daily basis. Those policemen always stay in that area to stop motorcycle riders and motorists. But I believe the man that was being extorted in that video is not the motorcycle rider. It must be his passenger, who could be a&nbsp;<em>yahoo-yahoo boy</em>&nbsp;(Internet fraudster). When policemen ask them (fraudsters) for money, they give excuses. The excuses may have forced the policeman to devise the method of the POS terminal.</p>

<p>&nbsp;&ldquo;But for us as motorcycle riders, they collect between N5,000 and N10,000 when they seize our motorcycles. They have told us that we are their ATM. The policemen fond of this are from the Akinpelu and Makinde divisions.&rdquo;</p>

<p>&nbsp;Another motorcycle rider in the community said cops sometime threatened to take them to the Special Anti-Robbery Squad where they would be detained for robbery.</p>

<p>&nbsp;&ldquo;We all have been victims at different times. Sometimes, they ask us not to park close to banks or pick more than one passenger. They could say we have been asked to stop using a particular park and they will arrest us and start demanding money,&rdquo; he added.</p>

<p>&nbsp;A resident listed some of the points of extortion to include Akinniku Street, Bolade Junction and Oshodi Express bus stop.</p>

<p>&nbsp;&ldquo;There is nobody to call them to order; they just do as they like,&rdquo; he said.</p>

<p>&nbsp;The state Police Public Relations Officer, Olarinde Famous-Cole, said the command was aware of the video, adding that the policeman involved was arrested and detained.</p>

<p>&nbsp;He said, &ldquo;The policeman was on a stop-and-search on Tuesday. From what we gathered, he stopped a commercial motorcycle rider who was carrying a passenger with a bag. He asked the passenger what he had in his bag and he stated them.</p>

<p>&nbsp;&ldquo;The policeman searched the bag and found the POS terminal and other documents. When he asked him what he was doing with the POS, the man claimed he was using it to pay utility bills and that he worked with an electricity distribution company.</p>

<p>&nbsp;&ldquo;The policeman demanded a proof of identification and he tendered it. The policeman then asked him to go since there was nothing implicating on him. Unknown to all of them, a passerby was filming the scene without their knowledge.</p>

<p>&ldquo;We arrested the policeman initially. But this morning (Wednesday), we saw the same commercial motorcycle rider and asked him to give an account of what transpired. The&nbsp; rider gave the same account, saying the policeman did not collect any money from the passenger.&rdquo;</p>

<p><strong><em>Copyright PUNCH.&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</em></strong><br />
<em>All rights reserved. This material, and other digital content on this website, may not be reproduced, published, broadcast, rewritten or redistributed in whole or in part without prior express written permission from PUNCH.</em></p>

<p>&nbsp;</p>',0,'',0);
INSERT INTO "django_flatpage" VALUES(9,'/W’Bank-approves-$961m-for-Nigeria’s-economic-recovery-plan/','W’Bank approves $961m for Nigeria’s economic recovery plan','<p>&nbsp;</p>

<p style="text-align:center"><strong>Everest Amaefule and Bayo Akinloye</strong></p>

<p>The World Bank on Tuesday approved $961m loan to support the implementation of Nigeria&rsquo;s Economic Recovery and Growth Plan 2017-2020.</p>

<p>A statement made available to our correspondents on Wednesday by the Senior Communications Officer at the World Bank office in Nigeria, Olufunke Olufon, said the fund would go into two programme-for-results operations totalling $961m.</p>

<p>&nbsp;</p>

<p>One of the programmes is the Better Education Service Delivery for All, which will receive $611m. The programme aims to bring out-of-school children into the classroom, improve literacy, and strengthen accountability for results in basic education.</p>

<p>In 2013, 13.2 million school-age children were out of school, the overwhelming majority of who were in the North where out-of-school children rates were also higher among girls, in rural areas and form poor families, the bank said.</p>

<p>The second benefitting programme is the Kaduna State Economic Transformation Programme for Results, which will receive $350m credit. It focuses on enhancing private sector investment in Kaduna State through improved business environment, effective budget planning and execution, and fiscal accountability.</p>

<p>According to the bank, Kaduna State has taken a number of reform actions to improve its economic performance and social outcomes, and sustain the efforts.</p>

<p>The World Bank Country Director for Nigeria, Rachid Benmessaoud, was quoted to have said, &ldquo;Investing in human capital and creating economic opportunities for all are key areas of focus to achieve more inclusive and private-sector led growth.</p>

<p>&ldquo;These two operations support the government&rsquo;s economic and growth recovery plan and will help Nigeria achieve sustainable and measurable results.&rdquo;</p>

<p>The bank added that both operations implemented results-based financing, whereby disbursement of funds was linked to the achievement of tangible and verifiable results.</p>

<p>As a first phase for addressing out-of-school children in Nigeria, the BESDA aims to help enhance the effectiveness and efficiency of the federal Universal Basic Education Programme through incentivising results at the state level and thereby reduce the number of out-of-school children by roughly one third by 2022, the bank said.</p>

<p>The Kaduna operation, on the other hand, will support the state&rsquo;s ambitious reform efforts to increase both private investments for job creation and revenue generation, the bank said, adding that it would also strengthen budget performance and fiscal accountability through citizen engagement.</p>

<p><strong><em>Copyright PUNCH.&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</em></strong><br />
<em>All rights reserved. This material, and other digital content on this website, may not be reproduced, published, broadcast, rewritten or redistributed in whole or in part without prior express written permission from PUNCH.</em></p>

<p><strong>Contact:&nbsp;</strong><a href="mailto:editor@punchng.com"><strong>editor@punchng.com</strong></a></p>',0,'',0);
INSERT INTO "django_flatpage" VALUES(11,'/We’ve-resolved-Nigeria-must-not-break,-say-governors/','We’ve resolved Nigeria must not break, say governors','<p><strong><span style="background-color:#daa520">Olalekan Adetayo, Abuja</span></strong></p>

<p>State governors, on Wednesday, said they had resolved that they would not allow Nigeria to break up, stating that those fanning the embers of war were wasting their time.</p>

<p>&nbsp;</p>

<p>The governors spoke after their meeting with Acting President Yemi Osinbajo at the Presidential Villa, Abuja, in continuation of Osinbajo&rsquo;s consultations on the recent tension in the country as a result of several agitations.</p>

<p>Oyo State Governor, Abiola, Ajimobi, who spoke on behalf of the other governors, said the governors and other stakeholders had agreed that despite the agitations being witnessed in parts of the country, Nigeria must not break.</p>

<p>Speaking with State House correspondents at the end of a meeting, Osinbajo stated that any Nigerians expecting the country to break was only wasting his time.</p>

<p>&ldquo;The message is for Nigerians to work more together and collaborate. We have more to gain when we are united.</p>

<p>&ldquo;We cannot afford to break, and anybody that is thinking of that, is wasting his time, and we will not allow it, not in this country. All of us are unanimous about that,&rdquo; he added.</p>

<p>He said the governors resolved that the unity of the country &ldquo;is sacrosanct, non-negotiable and we have all agreed to work together to educate people.&rdquo;</p>

<p>Ajimobi added, &ldquo;Any time you have agitation, usually, there will be poverty; there will be unemployment; there will be hardship. So, we should address fundamentally these areas of poverty, unemployment and hardship.</p>

<p>&ldquo;Nigerians are by nature a united people; nobody cares whether you are from the north, south or the east.&rdquo;</p>

<p>The governor also warned against the consequences of war, urging Nigerians to learn from Rwanda and Somalia.</p>

<p>Osinbajo had appealed to the governors to always be ready to speak up against statements from individuals or groups capable of setting the nation on fire.</p>

<p>He said they must be ready to protect the nation and its democracy from the hands of those who were bent on dividing the country.</p>

<p>He spoke before the meeting, which was held inside the old Banquet Hall of the Presidential Villa, Abuja, went into a closed-door session.</p>

<p>He stated, &ldquo;We must not allow the careless use of words, careless expressions that may degenerate into crisis.</p>

<p>&ldquo;We are a people that like to talk and we express ourselves loudly but it is expected for us to recognise that it is those same words that can cause conflagration; that can unfortunately lead to calamity. We must be careful on how we express ourselves.</p>

<p>&ldquo;What we have seen in recent times is that some of the languages (words) used have tended to degenerate badly and I think that we must begin to speak up against some of these things and ensure that we protect our democracy and our nation from the hands of rhetoric that may just divide us.</p>

<p>Osinbajo, who had earlier met separately with leaders of thought and traditional rulers from both the North and the South-East, said those who participated in the previous consultations agreed that Nigeria&rsquo;s unity should not be taken for granted.</p>

<p>He said nobody wanted the nation to witness bloodshed or war.</p>

<p>While describing the previous meetings as frank and open, Osinbajo said they were able to agree on most of the critical issues that were discussed, and in most cases, changed perceptions that might have been long embedded in their minds.</p>

<p>He added that the participants also agreed that under no circumstances should hateful speeches be condoned and that government should take all steps necessary to bring to book all those who preached violence.</p>

<p>The acting President stated that they also agreed that government needed to do more to engage youths productively, create some jobs and multiply the economic opportunities available.</p>

<p>Osinbajo added, &ldquo;More importantly, we agreed on the need for leaders to speak out forcefully to counter divisive speech or any kind of warmongering.</p>

<p>&ldquo;We agreed that leaders, at all levels, must speak out forcefully against any kind of divisiveness or divisive speech. And we expect that our political leaders will do so without waiting to be prompted.</p>

<p>&ldquo;All of those who spoke felt that sometimes when leaders do not speak up promptly, it always results in degeneration, no matter what the problem may be.</p>

<p>&ldquo;This applied to both the statements made by the young people in the South-East as well as the youth in the northern states. We discovered there was a need for much greater resonance in the way that these things are done and for the leaders to speak up more forcefully.</p>

<p>&ldquo;We believe that if the leaders do not speak up forcefully enough, if for any reason, matters are allowed to degenerate, not only does leadership lose their legitimacy, they run the risk of things going completely out of&nbsp; control.&rdquo;</p>

<p>He commended the leaders from the North and South-East for their openness at the consultations, saying they were extremely responsible even in their criticisms of what they felt were issues that should have been better handled.</p>

<p>While saying their criticisms were fair and balanced, he commended them for their sense of responsibility and their leadership.</p>

<p>Osinbajo mentioned the issue of herdsmen and farmers crisis, especially the way that some of these had resulted in flashpoints across the country, as one of the issues raised at the previous meetings.</p>

<p>He said it was important that lasting and satisfactory solutions were found to the problems identified.</p>

<p>Describing the problems as multidimensional, Osinbajo said state governors had important roles to play especially because they were in control of their territories.</p>

<p>He stated, &ldquo;We must resist the temptation to play politics especially with matters of security, but to reach for simplistic narratives that might be originally expedient and satisfying but false, deceiving and sometimes unhealthy to proper understanding of the issues.&rdquo;</p>

<p>Governors, who attended the meeting, included Rauf Aregbesola (Osun); Abiola Ajimobi (Oyo); Dave Umahi (Ebonyi); Aminu Tambuwal (Sokoto); Abdullahi Ganduje (Kano); Nyesom Wike (Rivers) and Godwin Obaseki (Edo).</p>

<p>Among others are governors from Borno, Bayelsa, Akwa Ibom, Adamawa, Benue, Plateau, Kogi, Lagos, Kebbi, Ondo, Imo, Taraba and Anambra states among others.</p>

<p><strong><em>Copyright PUNCH.&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</em></strong><br />
<em>All rights reserved. This material, and other digital content on this website, may not be reproduced, published, broadcast, rewritten or redistributed in whole or in part without prior express written permission from PUNCH</em></p>',0,'',0);
INSERT INTO "django_flatpage" VALUES(12,'/Wike-opposes-NLNG-Act-amendment/','Wike opposes NLNG Act amendment','<p style="margin-left:40px">Rivers State Governor, <strong>Nyesom Wike</strong>, has stated that his administration will always defend the economy of the state and the South-South geopolitical zone and join forces with other governors from the zone to stop the amendment of the Nigeria Liquefied Natural Gas Act.</p>

<p>The governor also stated that agitation in the South-South had remained rife because the authorities had ignored the zone, even though it produces the wealth that sustains the nation, according to a statement by his Special Assistant on Electronic Media, Simeon Nwakaudu.</p>

<p>Speaking on Tuesday in Port Harcourt during a courtesy visit by the management of the NLNG Limited, Wike said that the state government would mobilise the state&rsquo;s representatives at the National Assembly to ensure that the firm remained in a good position to continue with its operations.</p>

<p>&nbsp;</p>

<p>He urged the Federal Government not to allow the amendment of the <a href="http://google.com">NLNG</a> Act to sail through at the National Assembly because of the negative multiplier effect it would have on the economy.</p>

<p>&ldquo;Anything that will affect the economy of Rivers State, we will always fight it. It is about Rivers State,&rdquo; the governor stated.</p>

<p>He commended the management of the NLNG for offering to partner the Federal Government to construct the Bodo-Bonny Bridge.</p>

<p>&ldquo;I thank you for the Bodo-Bonny Bridge. I hope it is not political. I have always advocated for this important bridge. I thank the NLNG for telling the Federal Government that it is willing to put down money for the construction of the bridge,&rdquo; the governor stated.</p>

<p>He pointed out that the people of the South-South always agitate for better investment of their resources in their respective communities because of the neglect they continued to suffer.</p>

<p>&ldquo;A big company like the NLNG Limited generates funds for the country, yet the Bodo-Bonny Bridge that will create access to Bonny has not been constructed,&rdquo; Wike said.</p>',0,'',0);
INSERT INTO "django_flatpage" VALUES(13,'/Eid-el-Fitr:-DSS-uncovers-plan-to-bomb-praying-grounds/','Eid-el-Fitr: DSS uncovers plan to bomb praying grounds','<p>Olusola Fabiyi, Abuja</p>

<p>The Department of State Services said it had uncovered a plan by suspected terrorists to stage series of coordinated attacks using explosives on different cities across the country during the Eid-el-Fitr.</p>

<p>It said the aim of the suspected terrorists was to hit on soft targets such as markets, public parks, public processions, recreation centres, as well worship areas during the Sallah celebration.</p>

<p>&nbsp;</p>

<p>The agency said that the plan by the suspected terrorists was to unleash mayhem on Kano, Sokoto, Kaduna and Maiduguri.</p>

<p>A director with the agency, Mr. Nnana Nnochiri, who briefed journalists in Abuja on Friday, however, said Nigerians should not worry about the planned attacks, saying that they had been nipped in the bud.</p>

<p>Nnochiri said, &ldquo;In the past few weeks, this service has uncovered a sinister plot by terrorist elements to stage series of coordinated attacks using explosives on different cities across the country.</p>

<p>&ldquo;Their aim was to hit on soft targets such as markets, public parks, public processions, recreation centres, as well as worship centres especially the Eid Praying grounds and other densely populated areas during the forthcoming Eid-el-Fitr Sallah celebrations.&rdquo;</p>

<p>Consequently, Nnochiri said that the service had arrested two suspects in connection with the foiled planned attacks.</p>

<p>He mentioned the names of the suspects as Yusuf Adamu and Abdumuminu Haladu, who he said were arrested in the early hours of Friday, in Sokoto.</p>

<p>He said that Adamu and his accomplice were to command the operation in Kano.</p>

<p>However, he said that the service had earlier arrested the suspected facilitator of the Kano attack, Bashir Mohammed.</p>

<p>Nnochiri, who described the suspect as an explosive expert, said that he (Mohammed) was arrested at Unguwar Barnawa, Shekar Madaki, Kumbatso Local Government Area of Kano State on Tuesday.</p>

<p>&ldquo;Their plan, together with others now at large, was to assemble the explosives and use them on select targets during the Eid-el-Fitr Celebrations,&rdquo; Nnochiri added.</p>

<p>He said when the service conducted a search at the residence of Mohammed in Kano, different ammunitions and weapons were found.</p>

<p>He listed the items as eight AK-47 rifles, 20 fully loaded AK-A7 magazines, 27 hand grenades, 793) rounds of live ammunition, one gas cylinder and three laptops.</p>

<p>Others are one phone, one Lifan motorcycle, one Honda Civic Car and one printer.</p>

<p>Nnochiri said that the service had also uncovered plans by the terrorist elements to infiltrate the ranks of the Islamic Movement of Nigeria, a. k.a. Shiites.</p>

<p>He said this was an attempt to assume a formidable cover to unleash violence and evoke a complete state of chaos in the Federal Capital Territory, Abuja during the group&rsquo;s Qudus Day Procession/Rally scheduled for Friday in and several states in the northern parts of the country.</p>

<p>He called on the members of the set &ldquo;to desist from staging any form of procession or demonstration as the terrorists will seize the opportunity to unleash mayhem.&rdquo;</p>

<p>He also called on the members of the public to disregard the antics of &ldquo;these terrorist extremists to cause a breakdown of law and order and instil fear in the populace. &rdquo;</p>

<p>Nnochiri assured the public that the DSS was working, in concert with other security agencies, to ensure that no section of the &ldquo;country is attacked during and after the Sallah celebrations. &rdquo;</p>

<p>He called on law abiding citizens and residents to go about their normal businesses without fear of attack, adding that the service would engage all stakeholders to ensure a hitch-free Eid-el-Fitr festival across the country.</p>

<p>He, nevertheless, called on the members the public to remain very vigilant before, during and after the Sallah celebrations.</p>

<p>He equally appealed to people with useful information regarding suspicious movements and faces as well as unusual activities of criminals and terrorists around their neighbourhoods, to immediately avail same to the service or the nearest security agency.</p>',0,'',0);
DROP TABLE IF EXISTS "django_flatpage_sites";
CREATE TABLE "django_flatpage_sites" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "flatpage_id" integer NOT NULL REFERENCES "django_flatpage" ("id"), "site_id" integer NOT NULL REFERENCES "django_site" ("id"));
INSERT INTO "django_flatpage_sites" VALUES(4,4,2);
INSERT INTO "django_flatpage_sites" VALUES(5,5,2);
INSERT INTO "django_flatpage_sites" VALUES(6,6,2);
INSERT INTO "django_flatpage_sites" VALUES(7,7,2);
INSERT INTO "django_flatpage_sites" VALUES(9,9,2);
INSERT INTO "django_flatpage_sites" VALUES(11,11,2);
INSERT INTO "django_flatpage_sites" VALUES(12,12,2);
INSERT INTO "django_flatpage_sites" VALUES(13,13,2);
DROP TABLE IF EXISTS "django_migrations";
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2017-06-21 10:17:10.314123');
INSERT INTO "django_migrations" VALUES(2,'auth','0001_initial','2017-06-21 10:17:10.681927');
INSERT INTO "django_migrations" VALUES(3,'admin','0001_initial','2017-06-21 10:17:11.005947');
INSERT INTO "django_migrations" VALUES(4,'admin','0002_logentry_remove_auto_add','2017-06-21 10:17:11.359104');
INSERT INTO "django_migrations" VALUES(5,'app','0001_initial','2017-06-21 10:17:11.769502');
INSERT INTO "django_migrations" VALUES(6,'contenttypes','0002_remove_content_type_name','2017-06-21 10:17:12.233255');
INSERT INTO "django_migrations" VALUES(7,'auth','0002_alter_permission_name_max_length','2017-06-21 10:17:12.623487');
INSERT INTO "django_migrations" VALUES(8,'auth','0003_alter_user_email_max_length','2017-06-21 10:17:12.987426');
INSERT INTO "django_migrations" VALUES(9,'auth','0004_alter_user_username_opts','2017-06-21 10:17:13.520159');
INSERT INTO "django_migrations" VALUES(10,'auth','0005_alter_user_last_login_null','2017-06-21 10:17:14.018730');
INSERT INTO "django_migrations" VALUES(11,'auth','0006_require_contenttypes_0002','2017-06-21 10:17:14.149755');
INSERT INTO "django_migrations" VALUES(12,'auth','0007_alter_validators_add_error_messages','2017-06-21 10:17:14.478377');
INSERT INTO "django_migrations" VALUES(13,'auth','0008_alter_user_username_max_length','2017-06-21 10:17:14.899577');
INSERT INTO "django_migrations" VALUES(14,'sites','0001_initial','2017-06-21 10:17:15.220039');
INSERT INTO "django_migrations" VALUES(15,'flatpages','0001_initial','2017-06-21 10:17:15.557485');
INSERT INTO "django_migrations" VALUES(16,'sessions','0001_initial','2017-06-21 10:17:15.867307');
INSERT INTO "django_migrations" VALUES(17,'sites','0002_alter_domain_unique','2017-06-21 10:17:16.211906');
INSERT INTO "django_migrations" VALUES(18,'extended_flatpages','0001_initial','2017-06-21 13:47:38.456200');
INSERT INTO "django_migrations" VALUES(19,'app','0002_storyflatpage','2017-06-22 11:14:49.823328');
INSERT INTO "django_migrations" VALUES(20,'app','0003_storyflatpage_story_date','2017-06-22 12:44:22.966452');
DROP TABLE IF EXISTS "django_session";
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO "django_session" VALUES('gco4bzqmbrv8zp93udqoqgtjzoakzqd2','ZDg1MGYxZmE3ODI4ZTMxMzIwNjljZDhkZDU1NjRiOGVjNjQ1NTk5Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzAwNzY0MGZlNWQ2NmYyNjRhOWNjZWIzODBhMzhkOThiYmNlZDRhNyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-07-05 13:46:30.638955');
INSERT INTO "django_session" VALUES('4bsgb3orkptrjj5jbjjn3afszjorquz4','M2VlMmVlMmYzYWUxN2YzY2Q2OTlmMjFkYjJiZTEwOTg0NzdlNDk2ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzAwNzY0MGZlNWQ2NmYyNjRhOWNjZWIzODBhMzhkOThiYmNlZDRhNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-07-05 16:11:04.262074');
DROP TABLE IF EXISTS "django_site";
CREATE TABLE "django_site" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL, "domain" varchar(100) NOT NULL UNIQUE);
INSERT INTO "django_site" VALUES(2,'localhost','localhost:8888');
DROP TABLE IF EXISTS "extended_flatpages_cmsflatpage";
CREATE TABLE "extended_flatpages_cmsflatpage" ("flatpage_ptr_id" integer NOT NULL PRIMARY KEY REFERENCES "django_flatpage" ("id"), "description" varchar(100) NOT NULL, "keywords" varchar(255) NOT NULL);
INSERT INTO "extended_flatpages_cmsflatpage" VALUES(4,'testing1 descriptio','testing 1');
INSERT INTO "extended_flatpages_cmsflatpage" VALUES(5,'testing2 descriptio','testing 2');
INSERT INTO "extended_flatpages_cmsflatpage" VALUES(6,'testing3 descriptio','testing 3');
INSERT INTO "extended_flatpages_cmsflatpage" VALUES(7,'THE Lagos State Police Command on Wednesday cleared a policeman attached to the Makinde Police Divis','');
INSERT INTO "extended_flatpages_cmsflatpage" VALUES(9,'rrtf','');
INSERT INTO "extended_flatpages_cmsflatpage" VALUES(11,'op;','');
INSERT INTO "extended_flatpages_cmsflatpage" VALUES(12,'lki','');
INSERT INTO "extended_flatpages_cmsflatpage" VALUES(13,'Eid-el-Fitr: DSS uncovers plan to bomb praying grounds','');
CREATE INDEX "app_poll_poll_author_id_e60217d6" ON "app_poll" ("poll_author_id");
CREATE INDEX "app_poll_poll_surveytag_id_e53491b6" ON "app_poll" ("poll_surveytag_id");
CREATE INDEX "app_surveytag_surveytag_owner_id_ec535f08" ON "app_surveytag" ("surveytag_owner_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE INDEX "django_flatpage_sites_flatpage_id_078bbc8b" ON "django_flatpage_sites" ("flatpage_id");
CREATE UNIQUE INDEX "django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq" ON "django_flatpage_sites" ("flatpage_id", "site_id");
CREATE INDEX "django_flatpage_sites_site_id_bfd8ea84" ON "django_flatpage_sites" ("site_id");
CREATE INDEX "django_flatpage_url_41612362" ON "django_flatpage" ("url");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
