-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 06, 2026 at 11:54 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pcscloud_lab_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_table`
--

CREATE TABLE `admin_user_table` (
  `id` int(11) NOT NULL,
  `admin_name` varchar(45) DEFAULT NULL,
  `admin_email` varchar(45) NOT NULL,
  `admin_password` varchar(45) DEFAULT NULL,
  `admin_mobile` varchar(45) NOT NULL,
  `admin_role` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_user_table`
--

INSERT INTO `admin_user_table` (`id`, `admin_name`, `admin_email`, `admin_password`, `admin_mobile`, `admin_role`) VALUES
(1, 'Manish Halder', 'admin@mail.com', '1234', '8145473533', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `associate_registration`
--

CREATE TABLE `associate_registration` (
  `id` int(11) NOT NULL,
  `associate_name` varchar(45) NOT NULL,
  `associate_email` varchar(45) NOT NULL,
  `associate_password` varchar(45) DEFAULT NULL,
  `associate_gender` varchar(45) DEFAULT NULL,
  `associate_doj` varchar(45) DEFAULT NULL,
  `associate_emp_id` varchar(45) NOT NULL,
  `associate_designation` varchar(45) DEFAULT NULL,
  `associate_location` varchar(45) DEFAULT NULL,
  `associate_nationality` varchar(45) DEFAULT NULL,
  `associate_mobile` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `associate_registration`
--

INSERT INTO `associate_registration` (`id`, `associate_name`, `associate_email`, `associate_password`, `associate_gender`, `associate_doj`, `associate_emp_id`, `associate_designation`, `associate_location`, `associate_nationality`, `associate_mobile`) VALUES
(1, 'Manish Halder', 'manish@gmail.com', '1234', 'male', NULL, 'null', 'null', 'null', 'null', '8145473533'),
(2, 'Arit Saha', 'arit@gmail.com', '1234', 'male', NULL, 'null', 'null', 'null', 'null', '9999000090');

-- --------------------------------------------------------

--
-- Table structure for table `code_number`
--

CREATE TABLE `code_number` (
  `id` int(11) NOT NULL,
  `course_details_code` bigint(20) DEFAULT 1000,
  `course_content_code` bigint(20) DEFAULT 1000
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `code_number`
--

INSERT INTO `code_number` (`id`, `course_details_code`, `course_content_code`) VALUES
(1, 1009, 1009);

-- --------------------------------------------------------

--
-- Table structure for table `country_name`
--

CREATE TABLE `country_name` (
  `COUNTRY_CODE` varchar(4) NOT NULL,
  `COUNTRY_NAME` varchar(200) NOT NULL,
  `COUNTRY_SHORT_NAME` varchar(200) NOT NULL,
  `COUNTRY_NATIONAL_FLAG` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `country_name`
--

INSERT INTO `country_name` (`COUNTRY_CODE`, `COUNTRY_NAME`, `COUNTRY_SHORT_NAME`, `COUNTRY_NATIONAL_FLAG`) VALUES
('9997', 'Other', 'Other', ''),
('AFG', 'Afganistan ', 'afganistan ', 'Afghanistan-Flag'),
('AFU', 'African Union', 'african_union', 'African-Union-Flag'),
('AGI', 'Anguilla', 'anguilla', 'Anguilla-Flag'),
('AGL', 'Angola', 'angola', 'Angola-Flag'),
('ALA', 'Alaska', 'alaska', 'Alaska-Flag'),
('ALB', 'Albania', 'albania', 'Albania-Flag'),
('ALG', 'Algeria', 'algeria', 'Algeria-Flag'),
('AND', 'Andorra', 'andorra', 'Andorra-Flag'),
('ANT', 'Antarctica', 'antarctica', 'Antarctica-Flag'),
('ARG', 'Argentina', 'argentina', 'Argentina-Flag'),
('ARL', 'Arab League', 'arab_league', 'Arab-League-Flag'),
('ARM', 'Armenia', 'armenia', 'Armenia-Flag'),
('ARU', 'Aruba', 'aruba', 'Aruba-Flag'),
('ASE', 'Asean', 'asean', 'Asean-Flag'),
('ATG', 'Antigua & Barbuda', 'antigua_barbuda', 'Antigua-and-Barbuda-Flag'),
('ATN', 'Netherlands Antilles', 'netherlands_antilles', 'Netherlands-Antilles-Flag'),
('AUS', 'Australia', 'australia', 'Australia-Flag'),
('AUT', 'Austria', 'austria', 'Austria-Flag'),
('AZE', 'Azerbaijan', 'azerbaijan', 'Azerbaijan-Flag'),
('AZR', 'Azores', 'azores', ''),
('BAH', 'Bahamas', 'bahamas', 'Bahamas-Flag'),
('BDI', 'Burundi', 'burundi', 'Burundi-Flag'),
('BEL', 'Belgium', 'belgium', 'Belgium-Flag'),
('BEN', 'Benin', 'benin', 'Benin-Flag'),
('BER', 'Bermuda', 'bermuda', 'Bermuda-Flag'),
('BFS', 'Burkina Faso', 'burkina_faso', 'Burkina-Faso-Flag'),
('BHR', 'Bahrain', 'bahrain', 'Bahrain-Flag'),
('BHU', 'Bhutan', 'bhutan', 'Bhutan-Flag'),
('BLR', 'Belarus', 'belarus', 'Belarus-Flag'),
('BLZ', 'Belize', 'belize', 'Belize-Flag'),
('BNG', 'Bangladesh', 'bangladesh', 'Bangladesh-Flag'),
('BOL', 'Bolivia', 'bolivia', 'Bolivia-Flag'),
('BOS', 'Bosnia & Herzegovina', 'bosnia_and_herzegovina', 'Bosnia-and-Herzegovina-Flag'),
('BOT', 'Botswana', 'botswana', 'Botswana-Flag'),
('BRA', 'Brazil', 'brazil', 'Brazil-Flag'),
('BRB', 'Barbados', 'barbados', 'Barbados-Flag'),
('BRU', 'Brunei', 'brunei', 'Brunei-Flag'),
('BUL', 'Bulgaria', 'bulgaria', 'Bulgaria-Flag'),
('CAF', 'Central African Rep. ', 'central_african_rep. ', 'Central-African-Republic-Flag'),
('CAM', 'Cameroon', 'cameroon', 'Cameroon-Flag'),
('CAN', 'Canada', 'canada', 'Canada-Flag'),
('CAR', 'Caricom', 'caricom', 'Caricom-Flag'),
('CAV', 'Cape Verde', 'cape_verde', 'Cape-Verde-Flag'),
('CBG', 'Cambodia', 'cambodia', 'Cambodia-Flag'),
('CHL', 'Chile', 'chile', 'Chile-Flag'),
('CHN', 'China', 'china', 'China-Flag'),
('CHR', 'Christmas Island', 'christmas_island', ''),
('CIS', 'Cis', 'cis', 'Cis-Flag'),
('CIV', 'Ivory Coast', 'ivory_coast', ''),
('COG', 'Congo', 'congo', 'Congo-Brazzaville-Flag'),
('COK', 'Cook Islands', 'cook_islands', 'Cook-Islands-Flag'),
('COL', 'Colombia', 'colombia', ''),
('COM', 'Comoros', 'comoros', 'Comoros-Flag'),
('CRI', 'Costa Rica', 'costa_rica', 'Costa-Rica-Flag'),
('CRO', 'Croatia', 'croatia', 'Croatia-Flag'),
('CUB', 'Cuba', 'cuba', 'Cuba-Flag'),
('CWN', 'Commonwealth of Nations', 'commonwealth_of_nations', 'Commonwealth-of-Nations-Flag'),
('CYM', 'Cayman Islands', 'cayman_islands', 'Cayman-Islands-Flag'),
('CYP', 'Cyprus', 'cyprus', 'Cyprus-Flag'),
('DJI', 'Djibouti', 'djibouti', 'Djibouti-Flag'),
('DMA', 'Dominica', 'dominica', 'Dominica-Flag'),
('DNK', 'Denmark', 'denmark', 'Denmark-Flag'),
('DOM', 'Dominican Rep. ', 'dominican_rep.', 'Dominican-Republic-Flag'),
('ECU', 'Ecuador', 'ecuador', 'Ecuador-Flag'),
('EGY', 'Egypt', 'egypt', 'Egypt-Flag'),
('ENG', 'England', 'england', 'England-Flag'),
('EOU', 'European Union', 'european_union', 'European-Union-Flag'),
('ERI', 'Eritrea', 'eritrea', 'Eritrea-Flag'),
('ESA', 'El Salvador', 'e_salvador_flag', 'El-Salvador-Flag'),
('ESP', 'Spain', 'spain', 'Spain-Flag'),
('EST', 'Estonia', 'estonia', 'Estonia-Flag'),
('ETH', 'Ethiopia', 'ethiopia', 'Ethiopia-Flag'),
('FIJ', 'Fiji', 'fiji', 'Fiji-Flag'),
('FIN', 'Finland', 'finland', 'Finland-Flag'),
('FLK', 'Falkland Islands', 'falkland_islands', ''),
('FRA', 'France', 'france', 'France-Flag'),
('FRO', 'Faroe Islands', 'faroe_islands', 'Faroes-Flag'),
('GAB', 'Gabon', 'gabon', 'Gabon-Flag'),
('GAM', 'Gambia', 'gambia', 'Gambia-Flag'),
('GBR', 'Great Britain', 'great_britain', ''),
('GDL', 'Guadeloupe', 'guadeloupe', ''),
('GEO', 'Georgia', 'georgia', 'Georgia-Flag'),
('GER', 'Germany', 'germany', 'Germany-Flag'),
('GHA', 'Ghana', 'ghana', 'Ghana-Flag'),
('GIA', 'French Guiana', 'french_guiana', ''),
('GIB', 'Gibraltar', 'gibraltar', 'Gibraltar-Flag'),
('GNB', 'Guinea-Bissau', 'guinea-bissau', 'Guinea-Bissau-Flag'),
('GNE', 'Equatorial Guinea', 'equatorial_guinea', 'Equatorial-Guinea-Flag'),
('GRD', 'Grenada', 'grenada', 'Grenada-Flag'),
('GRE', 'Greece', 'greece', 'Greece-Flag'),
('GRL', 'Greenland', 'greenland', ''),
('GTM', 'Guatemala', 'guatemala', 'Guatemala-Flag'),
('GUI', 'Guinea', 'guinea', 'Guinea-Flag'),
('GUM', 'Guam', 'guam', 'Guam-Flag'),
('GUY', 'Guyana', 'guyana', 'Guyana-Flag'),
('HAI', 'Haiti', 'haiti', 'Haiti-Flag'),
('HAW', 'Hawaii', 'hawaii', ''),
('HND', 'Honduras', 'honduras', 'Honduras-Flag'),
('HNK', 'Hong Kong', 'hong_kong', 'Hong-Kong-Flag'),
('HUN', 'Hungary', 'hungary', 'Hungary-Flag'),
('ICA', 'Canary Islands', 'canary_islands', ''),
('ICF', 'Islamic Conference', 'islamic_conference', 'Islamic-Conference-Flag'),
('IDN', 'Indonesia', 'indonesia', 'Indonesia-Flag'),
('IND', 'India', 'india', 'India-Flag'),
('IRL', 'Ireland', 'ireland', 'Ireland-Flag'),
('IRN', 'Iran', 'iran', 'Iran-Flag'),
('IRQ', 'Iraq', 'iraq', 'Iraq-Flag'),
('ISL', 'Iceland', 'iceland', 'Iceland-Flag'),
('ISR', 'Israel', 'israel', 'Israel-Flag'),
('ITA', 'Italy', 'italy', 'Italy-Flag'),
('JAM', 'Jamaica', 'jamaica', 'Jamaica-Flag'),
('JAP', 'Japan', 'japan', 'Japan-Flag'),
('JER', 'Channel Islands', 'channel_islands', ''),
('JOR', 'Jordan', 'jordan', 'Jordan-Flag'),
('KAZ', 'Kazakhstan', 'kazakhstan', 'Kazakhstan-Flag'),
('KEN', 'Kenya', 'kenya', 'Kenya-Flag'),
('KGZ', 'Kyrgyzstan', 'kyrgyzstan', 'Kyrgyzstan-Flag'),
('KIR', 'Kiribati', 'kiribati', 'Kiribati-Flag'),
('KOR', 'Korea', 'korea', ''),
('KUW', 'Kuwait', 'kuwait', 'Kuwait-Flag'),
('LAO', 'Laos', 'laos', 'Laos-Flag'),
('LAT', 'Latvia', 'latvia', 'Latvia-Flag'),
('LBR', 'Liberia', 'liberia', 'Liberia-Flag'),
('LBY', 'Libya', 'libya', 'Libya-Flag'),
('LIB', 'Lebanon', 'lebanon', 'Lebanon-Flag'),
('LIE', 'Liechtenstein', 'liechtenstein', 'Liechtenshein-Flag'),
('LIT', 'Lithuania', 'lithuania', 'Lithuania-Flag'),
('LSO', 'Lesotho', 'lesotho', 'Lesotho-Flag'),
('LUX', 'Luxembourg', 'luxembourg', 'Luxembourg-Flag'),
('MAC', 'Macau', 'macau', 'Macau-Flag'),
('MAD', 'Madagascar', 'madagascar', 'Madagascar-Flag'),
('MAN', 'Isle of Man', 'isle_of_man', ''),
('MAR', 'Morocco', 'morocco', 'Morocco-Flag'),
('MCO', 'Monaco', 'monaco', 'Monaco-Flag'),
('MDR', 'Madeira', 'madeira', ''),
('MEX', 'Mexico', 'mexico', 'Mexico-Flag'),
('MHL', 'Marshall Islands', 'marshall_islands', 'Marshall-Islands-Flag'),
('MIC', 'Micronesia', 'micronesia', 'Micronesia-Flag'),
('MKD', 'Macedonia', 'macedonia', 'Macedonia-Flag'),
('MLD', 'Maldives', 'maldives', 'Maldives-Flag'),
('MLI', 'Mali', 'mali', 'Mali-Flag'),
('MLS', 'Malaysia', 'malaysia', 'Malaysia-Flag'),
('MLT', 'Malta', 'malta', 'Malta-Flag'),
('MMR', 'Burma (Myanmar)', 'burma_Myanmar', NULL),
('MNG', 'Mongolia', 'mongolia', 'Mongolia-Flag'),
('MOL', 'Moldova', 'moldova', 'Moldova-Flag'),
('MOZ', 'Mozambique', 'mozambique', 'Mozambique-Flag'),
('MRI', 'Mauritius', 'mauritius', 'Mauritius-Flag'),
('MRN', 'Mariana Islands', 'mariana_islands', ''),
('MRT', 'Mauritania', 'mauritania', 'Mauritania-Flag'),
('MSR', 'Montserrat', 'montserrat', 'Montserrat-Flag'),
('MTG', 'Montenegro', 'montenegro', 'Montenegro-Flag'),
('MTN', 'Martinique', 'martinique', ''),
('MWI', 'Malawi', 'malawi', 'Malawi-Flag'),
('MYT', 'Mayotte', 'mayotte', ''),
('NAM', 'Namibia', 'namibia', 'Namibia-Flag'),
('NCL', 'New Caledonia', 'new_caledonia', ''),
('NCP', 'Northern Cyprus', 'northern-Cyprus-Flag', 'Northern-Cyprus-Flag'),
('NED', 'Netherlands', 'netherlands', 'Netherlands-Flag'),
('NEP', 'Nepal', 'nepal', 'Nepal-Flag'),
('NFK', 'Norfolk', 'norfolk', ''),
('NGR', 'Niger', 'niger', 'Niger-Flag'),
('NIC', 'Nicaragua', 'nicaragua', 'Nicaragua-Flag'),
('NIG', 'Nigeria', 'nigeria', 'Nigeria-Flag'),
('NIL', 'Northern Ireland', 'northern_ireland', 'Northern-Ireland-Flag'),
('NIU', 'Niue', 'niue', ''),
('NKR', 'North Korea', 'nort_korea', 'North-Korea-Flag'),
('NOR', 'Norway', 'norway', ''),
('NRU', 'Nauru', 'nauru', 'Nauru-Flag'),
('NRW', 'Norway-Flag', 'Norway-Flag', 'Norway-Flag'),
('NZL', 'New Zealand', 'new_zealand', 'New-Zealand-Flag'),
('OMA', 'Oman', 'oman', 'Oman-Flag'),
('PAK', 'Pakistan', 'pakistan', 'Pakistan-Flag'),
('PAN', 'Panama', 'panama', 'Panama-Flag'),
('PAR', 'Paraguay', 'paraguay', 'Paraguay-Flag'),
('PER', 'Peru', 'peru', 'Peru-Flag'),
('PFR', 'French Polynesia', 'french_polynesia', ''),
('PHL', 'Philippines', 'philippines', 'Philippines-Flag'),
('PIT', 'Pitcairn', 'pitcairn', ''),
('PLS', 'Palestine', 'palestine', 'Palestine-Flag'),
('PLW', 'Palau', 'palau', 'Palau-Flag'),
('PNG', 'Papua New Guinea', 'papua_new_guinea', 'Papua-New-Guinea-Flag'),
('POL', 'Poland', 'poland', 'Poland-Flag'),
('PRI', 'Puerto Rico', 'puerto_rico', 'Puerto-Rico-Flag'),
('PRT', 'Portugal', 'portugal', 'Portugal-Flag'),
('QAT', 'Qatar', 'qatar', 'Qatar-Flag'),
('REU', 'Reunion', 'qeunion', ''),
('ROM', 'Romania', 'romania', 'Romania-Flag'),
('RUS', 'Russia', 'russia', 'Russian-Federation-Flag'),
('RWA', 'Rwanda', 'rwanda', 'Rwanda-Flag'),
('SAA', 'American Samoa', 'american_samoa', 'American-Samoa-Flag'),
('SAF', 'South Africa', 'south_africa', 'South-Africa-Flag'),
('SAM', 'Samoa (Western) ', 'samoa_western', ''),
('SAU', 'Saudi Arabia', 'saudi_arabia', 'Saudi-Arabia-Flag'),
('SDN', 'Sudan', 'sudan', 'Sudan-Flag'),
('SEN', 'Senegal', 'senegal', 'Senegal-Flag'),
('SEY', 'Seychelles', 'seychelles', 'Seychelles-Flag'),
('SGP', 'Singapore', 'singapore', 'Singapore-Flag'),
('SHE', 'Saint Helena', 'saint_helena', ''),
('SKN', 'St Kitts and Nevis', 'st_kitts_and_nevis', 'St-Kitts-and-Nevis-Flag'),
('SKR', 'South Korea', 'south_korea', 'South-Korea-Flag'),
('SLE', 'Sierra Leone', 'sierra_leone', 'Sierra-Leone-Flag'),
('SLM', 'Solomon', 'solomon', 'Solomon-Islands-Flag'),
('SLO', 'Slovakia', 'slovakia', 'Slovakia-Flag'),
('SLU', 'Saint Lucia', 'saint_lucia', 'Saint-Lucia-Flag'),
('SLV', 'Salvador', 'salvador', ''),
('SMR', 'San Marino', 'san_marino', 'Samoa-Flag'),
('SOM', 'Somalia', 'somalia', 'Somalia-Flag'),
('SPM', 'St Pierre & Miquelon', 'st_pierre_miquelon', ''),
('SRB', 'Serbia', 'serbia', 'Serbia-Flag'),
('SRI', 'Sri Lanka', 'sri_lanka', 'Sri-Lanka-Flag'),
('STP', 'Sao Tome & Principe', 'sao_tome_and_principe', 'Sao-Tome-and-Principe-Flag'),
('SUI', 'Switzerland', 'switzerland', 'Switzerland-Flag'),
('SUR', 'Suriname', 'suriname', 'Suriname-Flag'),
('SVN', 'Slovenia', 'slovenia', 'Slovenia-Flag'),
('SWA', 'Swaziland', 'swaziland', 'Swaziland-Flag'),
('SWE', 'Sweden', 'sweden', 'Sweden-Flag'),
('SYR', 'Syria', 'syria', 'Syria-Flag'),
('TAI', 'Taiwan', 'taiwan', 'Taiwan-Flag'),
('TCA', 'Turks & Caicos Isl. ', 'turks_and_caicos_isl', 'Turks-and-Caicos-Islands-Flag'),
('TCD', 'Chad', 'chad', 'Chad-Flag'),
('TCH', 'Czech Rep. ', 'czech_rep. ', 'Czech-Republic-Flag'),
('THA', 'Thailand', 'thailand', 'Thailand-Flag'),
('TIM', 'East Timor', 'east_timor', 'East-Timor-Flag'),
('TJK', 'Tajikistan', 'tajikistan', 'Tajikistan-Flag'),
('TKM', 'Turkmenistan', 'turkmenistan', 'Turkmenistan-Flag'),
('TOG', 'Togo', 'togo', 'Togo-Flag'),
('TOK', 'Tokelau', 'tokelau', NULL),
('TON', 'Tonga', 'tonga', 'Tonga-Flag'),
('TRI', 'Trinidad & Tobago', 'trinidad_and_tobago', 'Trinidad-and-Tobago-Flag'),
('TUN', 'Tunisia', 'tunisia', 'Tunisia-Flag'),
('TUR', 'Turkey', 'turkey', 'Turkey-Flag'),
('TUV', 'Tuvalu', 'tuvalu', 'Tuvalu-Flag'),
('TZA', 'Tanzania', 'tanzania', 'Tanzania-Flag'),
('UAE', 'United Arab Emirates', 'united_arab_emirates', 'United-Arab-Emirates-Flag'),
('UAW', 'USA / Hawaii', 'usa_slash_hawaii', ''),
('UDT', 'United Kingdom', 'united_kingdom', 'United-Kingdom-Flag'),
('UGA', 'Uganda', 'uganda', 'Uganda-Flag'),
('UKR', 'Ukraine', 'ukraine', 'Ukraine-Flag'),
('ULA', 'USA / Alaska', 'usa_slash_alaska', ''),
('URU', 'Uruguay', 'uruguay', 'Uruguay-Flag'),
('USA', 'USA', 'usa', 'United-States-of-America-Flag'),
('UZB', 'Uzbekistan', 'uzbekistan', 'Uzbekistan-Flag'),
('VAN', 'Vanuatu', 'vanuatu', 'Vanutau-Flag'),
('VAT', 'Vatican', 'vatican', 'Vatican-City-Flag'),
('VCT', 'St Vincent & Grenad.', 'st_vincent_and_grenad', ''),
('VEN', 'Venezuela', 'venezuela', 'Venezuela-Flag'),
('VIR', 'Virgin Island US', 'virgin_island_us', 'Virgin-Islands-US-Flag'),
('VRG', 'Virgin Island GB', 'virgin_island_gb', 'Virgin-Islands-British-Flag'),
('VTN', 'Viet Nam', 'viet_nam', 'Viet-Nam-Flag'),
('WAL', 'Wallis & Futuna', 'wallis_and_futuna', 'Wales-Flag'),
('YEM', 'Yemen', 'yemen', 'Yemen-Flag'),
('YUG', 'Yugoslavia', 'yugoslavia', ''),
('ZAI', 'Congo Dem. Rep', 'congo_dem_rep', 'Congo-Kinshasa-Flag'),
('ZAM', 'Zambia', 'zambia', 'Zambia-Flag'),
('ZIM', 'Zimbabwe', 'zimbabwe', 'Zimbabwe-Flag');

-- --------------------------------------------------------

--
-- Table structure for table `course_category_master`
--

CREATE TABLE `course_category_master` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(45) NOT NULL,
  `course_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_category_master`
--

INSERT INTO `course_category_master` (`course_id`, `course_code`, `course_name`) VALUES
(11, 'PCL001', 'Development'),
(12, 'PCL002', 'Buisness'),
(13, 'PCL003', 'Finance & Accounting'),
(14, 'PCL004', 'IT & Software'),
(15, 'PCL005', 'Office Management'),
(16, 'PCL006', 'Personal Development'),
(17, 'PCL007', 'Design'),
(18, 'PCL008', 'Marketing'),
(19, 'PCL009', 'Health & Fitness'),
(20, 'PCL010', 'Music'),
(28, 'PCL011', 'Teaching & Academics');

-- --------------------------------------------------------

--
-- Table structure for table `course_content`
--

CREATE TABLE `course_content` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(45) NOT NULL,
  `course_sub_catagory_code` varchar(245) DEFAULT NULL,
  `course_detail_code` varchar(45) DEFAULT NULL,
  `course_content_code` varchar(45) NOT NULL,
  `course_sections` varchar(245) DEFAULT NULL,
  `course_lectures_count` varchar(245) DEFAULT NULL,
  `course_total_duration` varchar(245) DEFAULT NULL,
  `course_prerequisite` varchar(1245) DEFAULT NULL,
  `course_detail_description` varchar(1545) DEFAULT NULL,
  `course_price_value` varchar(245) DEFAULT NULL,
  `course_discount_price` varchar(245) DEFAULT NULL,
  `course_feedback` varchar(245) DEFAULT NULL,
  `course_title_detail_name` varchar(1045) DEFAULT NULL,
  `course_usage_for` varchar(1045) DEFAULT NULL,
  `course_created_by` varchar(245) DEFAULT NULL,
  `course_grade_rating` varchar(245) DEFAULT NULL,
  `course_participant_count` varchar(245) DEFAULT NULL,
  `course_rated_by` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_content`
--

INSERT INTO `course_content` (`course_id`, `course_code`, `course_sub_catagory_code`, `course_detail_code`, `course_content_code`, `course_sections`, `course_lectures_count`, `course_total_duration`, `course_prerequisite`, `course_detail_description`, `course_price_value`, `course_discount_price`, `course_feedback`, `course_title_detail_name`, `course_usage_for`, `course_created_by`, `course_grade_rating`, `course_participant_count`, `course_rated_by`) VALUES
(1, 'PCL001', 'PCLSC001', 'PCLCD1001', 'PCLCC1001', 'JavaScript', '10', '100', 'A basic understanding of HTML and CSS', 'You will learn modern JavaScript from the very beginning, step-by-step. I will guide you through practical and fun code examples, important theory about how JavaScript works behind the scenes, and beautiful and complete projects', '8640', '5500', NULL, 'The modern JavaScript course for everyone! Master JavaScript with projects, challenges and theory. Many courses in one!', 'Take this course if you want to gain a true and deep understanding of JavaScript', 'Jonas Schmedtmann', NULL, NULL, NULL),
(2, 'PCL001', 'PCLSC002', 'PCLCD1002', 'PCLCC1002', 'python', '6', '120', 'Just some high school mathematics level.', 'This course has been designed by two professional Data Scientists so that we can share our knowledge and help you learn complex theory, algorithms, and coding libraries in a simple way.', '9990', '4599', NULL, 'Learn to create Machine Learning Algorithms in Python and R from two Data Science experts. Code templates included.', 'Any intermediate level people who know the basics of machine learning, including the classical algorithms like linear regression or logistic regression, but who want to learn more about it and explore all the different fields of Machine Learning.', 'Hadelin de Ponteves', NULL, NULL, NULL),
(3, 'PCL002', 'PCLSC0011', 'PCLCD1003', 'PCLCC1003', 'Business Fundamentals', '11', '117', 'Absolutely no experience is required. We will start from the basics and gradually build up your knowledge. Everything is in the course.', 'Start up your own business  \r\nGrow your existing venture  \r\nTake your career to the next level  \r\nGet promoted and apply managerial, financial, marketing, decision-making and negotiation skills in the real business world  \r\nHave an all-around view of why some companies (and people) succeed when doing business and others do not  ', '8650', '5500', NULL, 'A Complete MBA Training: Business Strategy, Management, Marketing, Accounting, Decision Making & Negotiation', 'People who want a successful career in Business', '365 Careers', NULL, NULL, NULL),
(4, 'PCL001', 'PCLSC004', 'PCLCD1004', 'PCLCC1004', 'MEAN Stack', '15', '115', '', 'Create modern, scalable and high-speed Web Applications with Angular (formerly named Angular 2, now just \"Angular\") and Node.js + Express + MongoDB.', '9990', '5000', NULL, 'Learn how to connect your Angular Frontend to a NodeJS & Express & MongoDB Backend by building a real Application', 'In this course, Maximilian, experienced web developer as well as author of many 5-star rated Udemy courses and host of the \"Academind\" coding channel on YouTube, will take you on a hands-on journey to get you to build your own Angular + NodeJS Applications in no time.', 'Maximilian Schwarzmüller', NULL, NULL, NULL),
(5, 'PCL001', 'PCLSC001', 'PCLCD1005', 'PCLCC1005', 'Django', '12', '120', 'A computer with an internet connection and download privileges', 'Welcome to the Python and Django Full Stack Web Developer Bootcamp! In this course we cover everything you need to know to build a website using Python, Django, and many more web technologies!', '8640', '4550', NULL, 'Learn to build websites with HTML , CSS , Bootstrap , Javascript , jQuery , Python 3 , and Django!', 'Complete Beginners\r\nProfessionals looking to bridge gaps in their knowledge\r\nPython Developers looking to get into Web Development', 'Jose Portilla', NULL, NULL, NULL),
(6, 'PCL001', 'PCLSC006', 'PCLCD1006', 'PCLCC1006', 'MongoDb', '10', '48', 'Basic computer knowledge and of course Mac or PC', 'Learn how MongoDB works behind the scenes. Course will be focused purely on MongoDB and MongoDB Shell. No external drivers or libraries.\r\n1. You will start from the installation of the MongoDB.\r\nInstallation will be performed on the:\r\n    - Local computer Mac or PC\r\n    - Dedicated or VPS server\r\n    -  MongoDB Atlas - Cloud MongoDB Software as a Service', '8640', '5000', NULL, 'Master MongoDB database using JavaScript Mongo Shell, Robo 3T (Robomongo) and MongoDB Compass', 'Developers who use or are planning to use MongoDB in their projects\r\nFull-stack developers', 'Aman Srivastava', NULL, NULL, NULL),
(7, 'PCL002', 'PCLSC0014', 'PCLCD1007', 'PCLCC1007', 'Sales Skills', '8', '17', 'The only thing required for this course is a student with an open mind, ready to improve their sales skills and their confidence.', 'Do you have a product, a service, an idea, or an opinion that you need to sell, yet fail to see consistent, predictable results?\r\nHave you ever thought to yourself, \"Why does selling come so naturally to some, but seem almost impossible for others?', '12000', '4550', NULL, 'Learn sales basics, techniques, and strategies that will give you the skills to sell anything.', 'This course is meant for anyone who has a service, idea, or product to sell to the public. More specifically, this is a course for those not satisfied with their current levels of production or income. Eddy Lim', 'Eddy Lim', NULL, NULL, NULL),
(8, 'PCL001', 'PCLSC001', 'PCLCD1008', 'PCLCC1008', 'Object Oriented Programming', '14', '115', 'HTML,c', 'Hands on Real Life Project inside!\r\nOn Demand OOP Skills Inside\r\nOOP is a must for everybody period!', '8640', '3500', NULL, 'PHP OOP: Learn OOP PHP and Take your skills to another level. Make serious money by building awesome applications.', 'Students with Basic PHP knowledge should take this course\r\nStudents looking for the ultimate PHP Course\r\nStudents looking to upgrade their PHP skills to another level', 'Steve Shead', NULL, NULL, NULL),
(9, 'PCL001', 'PCLSC001', 'PCLCD1009', 'PCLCC1009', 'Laravel', '11', '46', 'html,c', 'Laravel has become one of the most popular if not the most popular PHP framework. Employers are asking for this skill for all web programming jobs and in this course we have put together all of them, to give you the best chance of landing that job; or taking it to the next level.', '12000', '4550', NULL, 'Learn to master Laravel to make advanced applications like the real CMS app we build on this course', 'People looking for web programming jobs should take this course\r\nPeople looking to learn everything about laravel should take this course\r\nStudents who want to take their PHP skills to another level should take this course', 'Benoit Burke', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_detail_catagory`
--

CREATE TABLE `course_detail_catagory` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(45) NOT NULL,
  `course_sub_catagory_code` varchar(100) DEFAULT NULL,
  `course_detail_code` varchar(45) NOT NULL,
  `course_title_name` varchar(750) DEFAULT NULL,
  `course_title_detail_name` varchar(900) DEFAULT NULL,
  `course_usage_for` varchar(1500) DEFAULT NULL,
  `course_created_by` varchar(45) DEFAULT NULL,
  `course_grade_rating` varchar(45) DEFAULT NULL,
  `course_participant_count` varchar(45) DEFAULT NULL,
  `course_rated_by` varchar(45) DEFAULT NULL,
  `course_synopsis` varchar(1045) DEFAULT NULL,
  `course_thumbnail_path` varchar(545) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_detail_catagory`
--

INSERT INTO `course_detail_catagory` (`course_id`, `course_code`, `course_sub_catagory_code`, `course_detail_code`, `course_title_name`, `course_title_detail_name`, `course_usage_for`, `course_created_by`, `course_grade_rating`, `course_participant_count`, `course_rated_by`, `course_synopsis`, `course_thumbnail_path`) VALUES
(1, 'PCL001', 'PCLSC001', 'PCLCD1001', 'The Complete JavaScript Course 2021: From Zero to Expert!', 'The modern JavaScript course for everyone! Master JavaScript with projects, challenges and theory. Many courses in one!', 'Take this course if you want to gain a true and deep understanding of JavaScript', 'Jonas Schmedtmann', NULL, NULL, NULL, 'JavaScript is the most popular programming language in the world. It powers the entire modern web. It provides millions of high-paying jobs all over the world.', 'thumbnailImage/jsThumbOne.jpg'),
(3, 'PCL001', 'PCLSC002', 'PCLCD1002', 'Machine Learning A-Z?: Hands-On Python & R In Data Science', 'Learn to create Machine Learning Algorithms in Python and R from two Data Science experts. Code templates included.', 'Any intermediate level people who know the basics of machine learning, including the classical algorithms like linear regression or logistic regression, but who want to learn more about it and explore all the different fields of Machine Learning.', 'Hadelin de Ponteves', NULL, NULL, NULL, 'Learn to create Machine Learning Algorithms in Python and R from two Data Science experts. Code templates included.', 'thumbnailImage/mlThumbOne.png'),
(4, 'PCL002', 'PCLSC0011', 'PCLCD1003', 'MBA in a Box: Business Lessons from a CEO', 'A Complete MBA Training: Business Strategy, Management, Marketing, Accounting, Decision Making & Negotiation', 'People who want a successful career in Business', '365 Careers', NULL, NULL, NULL, 'This course is jam-packed with the same useful information and real-life case studies MBA graduates acquire throughout their training in top-tier business schools. ', 'thumbnailImage/MBA-to-Grow-Your-Career-in-Business.png'),
(5, 'PCL001', 'PCLSC004', 'PCLCD1004', 'Angular & NodeJS - The MEAN Stack Guide [2021 Edition]', 'Learn how to connect your Angular Frontend to a NodeJS & Express & MongoDB Backend by building a real Application', 'In this course, Maximilian, experienced web developer as well as author of many 5-star rated Udemy courses and host of the \"Academind\" coding channel on YouTube, will take you on a hands-on journey to get you to build your own Angular + NodeJS Applications in no time.', 'Maximilian Schwarzmüller', NULL, NULL, NULL, 'Benefit from the many improvements and advantages Angular offers you: Speed, ease of development, highly reactive, awesome support for asynchronous operations, great scalability and more!', 'thumbnailImage/angularzzzzthumb.png'),
(6, 'PCL001', 'PCLSC001', 'PCLCD1005', 'Python and Django Full Stack Web Developer Bootcamp', 'Learn to build websites with HTML , CSS , Bootstrap , Javascript , jQuery , Python 3 , and Django!', 'Complete Beginners\r\nProfessionals looking to bridge gaps in their knowledge\r\nPython Developers looking to get into Web Development', 'Jose Portilla', NULL, NULL, NULL, 'This course is designed so that anyone can learn how to become a web developer. We teach you how to program by using HD Video Lectures, Walkthrough Code Projects, Exercises, Concept Presentation Slides, Downloadable Code Notes, Reading Assignments, and much more! ', 'thumbnailImage/djangoThumbOne.jpg'),
(7, 'PCL001', 'PCLSC006', 'PCLCD1006', 'Complete MongoDB Administration Guide', 'Master MongoDB database using JavaScript Mongo Shell, Robo 3T (Robomongo) and MongoDB Compass', 'Developers who use or are planning to use MongoDB in their projects\r\nFull-stack developers', 'Aman Srivastava', NULL, NULL, NULL, ' Learn how to work in MongoDB Shell.  We will discuss and explore JavaScript Engine that is used in MongoDB.', 'thumbnailImage/mongoThumbNail.png'),
(8, 'PCL002', 'PCLSC0014', 'PCLCD1007', 'Learn to Sell Anything by Grant Cardone', 'Learn sales basics, techniques, and strategies that will give you the skills to sell anything.', 'This course is meant for anyone who has a service, idea, or product to sell to the public. More specifically, this is a course for those not satisfied with their current levels of production or income. Eddy Lim', 'Eddy Lim', NULL, NULL, NULL, 'The EXACT amount of effort for you to see success in selling\r\nThe MOST successful strategy to use when a customer wants a discount', 'thumbnailImage/salesThumbnail.jpg'),
(9, 'PCL001', 'PCLSC001', 'PCLCD1008', 'PHP OOP: Object Oriented Programming for beginners + Project', 'PHP OOP: Learn OOP PHP and Take your skills to another level. Make serious money by building awesome applications.', 'Students with Basic PHP knowledge should take this course\r\nStudents looking for the ultimate PHP Course\r\nStudents looking to upgrade their PHP skills to another level', 'Steve Shead', NULL, NULL, NULL, 'This course will guaranteed you success if you apply yourself, and take the time to learn everything included.\r\nPHP has allowed me to make a really great income, so much that It gives me time to teach others about it. You too can become a professional in the field, and create the life you always dreamed of.\r\nPHP is one of the best web programming languages in the world, and all the big important websites, like Google, Apple, Facebook, Yahoo, Wikipedia and many more, use it for their web applications.', 'thumbnailImage/thumbnailPHPOne.png'),
(10, 'PCL001', 'PCLSC001', 'PCLCD1009', 'PHP with Laravel for beginners - Become a Master in Laravel', 'Learn to master Laravel to make advanced applications like the real CMS app we build on this course', 'People looking for web programming jobs should take this course\r\nPeople looking to learn everything about laravel should take this course\r\nStudents who want to take their PHP skills to another level should take this course', 'Benoit Burke', NULL, NULL, NULL, 'Understood MVC in one sentence after so many years! A great deal of effort has been put to create the content in two parts, first for understanding the basic components (eloquent relationships, views, controller etc) and then actually using it in a project. And he loves teaching. We love learning from him!', 'thumbnailImage/thumbNailphpTwo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `course_sub_catagory`
--

CREATE TABLE `course_sub_catagory` (
  `id` int(11) NOT NULL,
  `course_code` varchar(45) DEFAULT NULL,
  `course_sub_catagory_code` varchar(10) NOT NULL,
  `course_sub_catagory_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `course_sub_catagory`
--

INSERT INTO `course_sub_catagory` (`id`, `course_code`, `course_sub_catagory_code`, `course_sub_catagory_name`) VALUES
(10, 'PCL001', 'PCLSC001', 'Web Development'),
(11, 'PCL001', 'PCLSC002', 'Data Science'),
(12, 'PCL001', 'PCLSC003', 'Mobile Development'),
(13, 'PCL001', 'PCLSC004', 'Programming Languages'),
(14, 'PCL001', 'PCLSC005', 'Game Developments'),
(15, 'PCL001', 'PCLSC006', 'Database Design & Development'),
(16, 'PCL001', 'PCLSC007', 'Software Testing'),
(17, 'PCL001', 'PCLSC008', 'Software Engineering'),
(18, 'PCL001', 'PCLSC009', 'Development Tools'),
(19, 'PCL001', 'PCLSC0010', 'No-code Development'),
(20, 'PCL002', 'PCLSC0011', 'Entrepreneurship'),
(21, 'PCL002', 'PCLSC0012', 'Communications'),
(22, 'PCL002', 'PCLSC0013', 'Management'),
(23, 'PCL002', 'PCLSC0014', 'sales'),
(24, 'PCL002', 'PCLSC0015', 'Strategy'),
(25, 'PCL002', 'PCLSC0016', 'Operations'),
(26, 'PCL002', 'PCLSC0017', 'Project-Management'),
(27, 'PCL002', 'PCLSC0018', 'Business-Law'),
(28, 'PCL002', 'PCLSC0019', 'Analytics-and-Intelligence'),
(29, 'PCL002', 'PCLSC0020', 'Human-Resources'),
(31, 'PCL002', 'PCLSC0021', 'E-Commerce'),
(32, 'PCL002', 'PCLSC0022', 'Media'),
(33, 'PCL002', 'PCLSC0023', 'Real-Estate'),
(34, 'PCL002', 'PCLSC0024', 'Other-Business'),
(35, 'PCL003', 'PCLSC0025', 'Finance-and-Accounting'),
(36, 'PCL003', 'PCLSC0026', 'Accounting-Bookkeeping'),
(37, 'PCL003', 'PCLSC0027', 'Compliance'),
(38, 'PCL003', 'PCLSC0028', 'Cryptocurrency-and-Blockchain'),
(39, 'PCL003', 'PCLSC0029', 'Economics'),
(40, 'PCL003', 'PCLSC0030', 'Finance-Management'),
(41, 'PCL003', 'PCLSC0031', 'Finance-certification-and-exam-prep'),
(42, 'PCL003', 'PCLSC0032', 'Financial-modeling-and-analysis'),
(43, 'PCL003', 'PCLSC0033', 'Investing-and-trading'),
(44, 'PCL003', 'PCLSC0034', 'Money-Management-Tools'),
(45, 'PCL003', 'PCLSC0035', 'Taxes'),
(46, 'PCL003', 'PCLSC0036', 'Other-finance-and-accounting'),
(47, 'PCL004', 'PCLSC0037', 'It-and-Software'),
(48, 'PCL004', 'PCLSC0038', 'It-Certification'),
(49, 'PCL004', 'PCLSC0039', 'Network-and-Security'),
(50, 'PCL004', 'PCLSC0040', 'Hardware'),
(51, 'PCL004', 'PCLSC0041', 'Operating-Systems'),
(52, 'PCL004', 'PCLSC0042', 'Other-It-and-Software');

-- --------------------------------------------------------

--
-- Table structure for table `lectures_playlist`
--

CREATE TABLE `lectures_playlist` (
  `id` int(11) NOT NULL,
  `course_detail_code` varchar(45) NOT NULL,
  `lectures_topics` varchar(500) DEFAULT NULL,
  `lectures_links_one` varchar(500) DEFAULT NULL,
  `lectures_links_two` varchar(500) DEFAULT NULL,
  `lectures_links_three` varchar(500) DEFAULT NULL,
  `lectures_links_four` varchar(500) DEFAULT NULL,
  `lectures_links_five` varchar(500) DEFAULT NULL,
  `lectures_links_six` varchar(500) DEFAULT NULL,
  `lectures_links_seven` varchar(500) DEFAULT NULL,
  `lectures_links_eight` varchar(500) DEFAULT NULL,
  `lectures_links_nine` varchar(500) DEFAULT NULL,
  `lectures_links_ten` varchar(500) DEFAULT NULL,
  `lectures_links_eleven` varchar(500) DEFAULT NULL,
  `lectures_links_twelve` varchar(500) DEFAULT NULL,
  `lectures_links_thirteen` varchar(500) DEFAULT NULL,
  `lectures_links_fourteen` varchar(500) DEFAULT NULL,
  `lectures_links_fifteen` varchar(500) DEFAULT NULL,
  `lectures_links_sixteen` varchar(500) DEFAULT NULL,
  `lectures_links_seventeen` varchar(500) DEFAULT NULL,
  `lectures_links_eighteen` varchar(500) DEFAULT NULL,
  `lectures_links_nineteen` varchar(500) DEFAULT NULL,
  `lectures_links_twenty` varchar(500) DEFAULT NULL,
  `lectures_links_twenty_one` varchar(500) DEFAULT NULL,
  `lectures_links_twenty_two` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lectures_playlist`
--

INSERT INTO `lectures_playlist` (`id`, `course_detail_code`, `lectures_topics`, `lectures_links_one`, `lectures_links_two`, `lectures_links_three`, `lectures_links_four`, `lectures_links_five`, `lectures_links_six`, `lectures_links_seven`, `lectures_links_eight`, `lectures_links_nine`, `lectures_links_ten`, `lectures_links_eleven`, `lectures_links_twelve`, `lectures_links_thirteen`, `lectures_links_fourteen`, `lectures_links_fifteen`, `lectures_links_sixteen`, `lectures_links_seventeen`, `lectures_links_eighteen`, `lectures_links_nineteen`, `lectures_links_twenty`, `lectures_links_twenty_one`, `lectures_links_twenty_two`) VALUES
(1, 'PCLCD1001', 'Deafult', 'https://www.youtube.com/embed/ntLJmHOJ0ME', 'https://www.youtube.com/embed/zIdg7hkqNE0', 'https://www.youtube.com/embed/X0zdAG7gfgs', 'https://www.youtube.com/embed/b2VJmyarV3I', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'PCLCD1002', 'Deafult', 'https://www.youtube.com/embed/IsLyduxZ9sc', 'https://www.youtube.com/embed/U_vuESBFEpE', 'https://www.youtube.com/embed/7i8vbPA37y0', 'https://www.youtube.com/embed/FB47F-QIk3k', 'https://www.youtube.com/embed/8qyVcHJ1Et4', 'https://www.youtube.com/embed/N53Vf8HGd-0', 'https://www.youtube.com/embed/slz2Vc904Qg', 'https://www.youtube.com/embed/Q0NVRQP1Z5g', 'https://www.youtube.com/embed/4H34eumdAZY', 'https://www.youtube.com/embed/uIyLyqmhzbM', 'https://www.youtube.com/embed/OIIfy0iUWhM', 'https://www.youtube.com/embed/lBu02Bf3gFg', 'https://www.youtube.com/embed/lBEUbu2M24Q', 'https://www.youtube.com/embed/zJZIm8GDUn8', 'https://www.youtube.com/embed/pCHHaUbedXc', 'https://www.youtube.com/embed/QLycTYkF8Q8', 'https://www.youtube.com/embed/i519HtRLWbY', 'https://www.youtube.com/embed/DzHGyfZH6fA', 'https://www.youtube.com/embed/QM0iW8fFSXs', 'https://www.youtube.com/embed/kPzea0g8xQg', 'https://www.youtube.com/embed/CmffeGETyk4', NULL),
(5, 'PCLCD1003', 'Deafult', 'https://www.youtube.com/embed/dEOYASL9sD0', 'https://www.youtube.com/embed/2gBvKGdI6QI', 'https://www.youtube.com/watch?v=LzKlDc-sZho&list=PLX9Zi6XTqOKQ7TdRz0QynGIKuMV9Q2H8E&index=62', 'https://www.youtube.com/watch?v=ubF0zxAdH2o&list=PLX9Zi6XTqOKQ7TdRz0QynGIKuMV9Q2H8E&index=63', 'https://www.youtube.com/watch?v=jYv0VRL9YL0&list=PLX9Zi6XTqOKQ7TdRz0QynGIKuMV9Q2H8E&index=64', 'https://www.youtube.com/watch?v=_0BieAQm8Gg&list=PLX9Zi6XTqOKQ7TdRz0QynGIKuMV9Q2H8E&index=65', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'PCLCD1004', 'Deafult', 'https://www.youtube.com/embed/0eWrpsCLMJQ', 'https://www.youtube.com/embed/FVPGJHinItI', 'https://www.youtube.com/embed/mDoHtD1hI3I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'PCLCD1005', 'Deafult', 'https://www.youtube.com/embed/EPzUN97KvNU', 'https://www.youtube.com/embed/6ICJxHlI1vM', 'https://www.youtube.com/embed/EZ-S1D39qy8', 'https://www.youtube.com/embed/B4r6QIUkCp8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'PCLCD1006', 'Deafult', 'https://www.youtube.com/embed/CaKoJ9rFo8c', 'https://www.youtube.com/embed/q1Y5UUQKVCQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'PCLCD1007', 'Deafult', 'https://www.youtube.com/embed/urWPYZ-lTPQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'PCLCD1008', 'Deafult', 'https://www.youtube.com/embed/Anz0ArcQ5kI', 'https://www.youtube.com/embed/3OKOe7CraGY', 'https://www.youtube.com/embed/iEGUOE9RKqM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'PCLCD1009', 'Deafult', 'https://www.youtube.com/embed/a60GYitJsMs', 'https://www.youtube.com/embed/6Awy7jO3H8A', 'https://www.youtube.com/embed/LMTHb7-qWvI', 'https://www.youtube.com/embed/O__sXPko7Mw', 'https://www.youtube.com/embed/ceU91_dRl3g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `location_name`
--

CREATE TABLE `location_name` (
  `LOCATION_ID` int(11) NOT NULL,
  `COUNTRY_CODE` varchar(4) DEFAULT NULL,
  `LOCATION_NAME` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `location_name`
--

INSERT INTO `location_name` (`LOCATION_ID`, `COUNTRY_CODE`, `LOCATION_NAME`) VALUES
(1, 'IND', 'Kolkata'),
(2, 'IND', 'Delhi'),
(3, 'IND', 'Aboha'),
(4, 'IND', 'Achalpur'),
(5, 'IND', 'Addankin'),
(6, 'IND', 'Adipur'),
(7, 'IND', 'Adra(Purulia)'),
(8, 'IND', 'Agartala'),
(9, 'IND', 'Agra'),
(10, 'IND', 'Ahmedabad '),
(11, 'IND', 'Ahmednagar '),
(12, 'IND', 'Aizawl'),
(13, 'IND', 'Ajmer'),
(14, 'IND', 'Akola '),
(15, 'IND', 'Aligarh '),
(16, 'IND', 'Allahabad '),
(17, 'IND', 'Alwar'),
(18, 'IND', 'Ambala '),
(19, 'IND', 'Amethi '),
(20, 'IND', 'Ammakandakara '),
(21, 'IND', 'Amravati '),
(22, 'IND', 'Amreli '),
(23, 'IND', 'Amritsar '),
(24, 'IND', 'Amroha '),
(25, 'IND', 'Anakapalle'),
(26, 'IND', 'Anand '),
(27, 'IND', 'Anantapur'),
(28, 'IND', 'Angul \r\n'),
(29, 'IND', 'Anklesvar '),
(30, 'IND', 'Anuppur'),
(31, 'IND', 'Arakkonam'),
(32, 'IND', 'Araria '),
(33, 'IND', 'Arcot '),
(34, 'IND', 'Arrah '),
(35, 'IND', 'Aruppukkottai '),
(36, 'IND', 'Asansol '),
(37, 'IND', 'Ashok Nagar '),
(38, 'IND', 'Ashtamichira '),
(39, 'IND', 'Asurbandh(Jharkhand) '),
(40, 'IND', 'Aurangabad(Bihar) '),
(41, 'IND', 'Aurangabad(Maharashtra) '),
(42, 'IND', 'Azamgarh'),
(43, 'IND', 'Bahadurgarh'),
(44, 'IND', 'Baharampur'),
(45, 'IND', 'Bahraich'),
(46, 'IND', 'Balaghat'),
(47, 'IND', 'Balangir '),
(48, 'IND', 'Balasore'),
(49, 'IND', 'Bali '),
(50, 'IND', 'Ballabhgarh'),
(51, 'IND', 'Ballia'),
(52, 'IND', 'Balrampur '),
(53, 'IND', 'Bamra'),
(54, 'IND', 'Banda'),
(55, 'IND', 'Banganapalle'),
(56, 'IND', 'Banswara'),
(57, 'IND', 'Banur '),
(58, 'IND', 'Bapatla '),
(59, 'IND', 'Baramati '),
(60, 'IND', 'Baran '),
(61, 'IND', 'Burdwan '),
(62, 'IND', 'Bareilly '),
(63, 'IND', 'Bargarh '),
(64, 'IND', 'Barh'),
(65, 'IND', 'Baripada'),
(66, 'IND', 'Barmer'),
(67, 'IND', 'Barnala '),
(68, 'IND', 'Barrackpur '),
(69, 'IND', 'Barwani'),
(70, 'IND', 'Bawal'),
(71, 'IND', 'Beawar'),
(72, 'IND', 'Belgaum '),
(73, 'IND', 'Bellary'),
(74, 'IND', 'Belpahar'),
(75, 'IND', 'Bangalore'),
(76, 'IND', 'Berhampur'),
(77, 'IND', 'Betul Goa'),
(78, 'IND', 'Betul Madhya Pradesh'),
(79, 'IND', 'Bhagalpur'),
(80, 'IND', 'Bhajanpura'),
(81, 'IND', 'Bhandara '),
(82, 'IND', 'Bharatpur'),
(83, 'IND', 'Bharthana'),
(84, 'IND', 'Bharuch '),
(85, 'IND', 'Bhavani'),
(86, 'IND', 'Bhavnagar '),
(87, 'IND', 'Bhilai'),
(88, 'IND', 'Bhilwara '),
(89, 'IND', 'Bhimavaram '),
(90, 'IND', 'Bhinmal'),
(91, 'IND', 'Bhiwandi'),
(92, 'IND', 'Bhiwani'),
(93, 'IND', 'Bhopal'),
(94, 'IND', 'Bhubaneswar'),
(95, 'IND', 'Bhuj'),
(96, 'IND', 'Bhusawal '),
(97, 'IND', 'Bidar'),
(98, 'IND', 'Bihar Sharif'),
(99, 'IND', 'Bijnor'),
(100, 'IND', 'Bikaner'),
(101, 'IND', 'Bilara'),
(102, 'IND', 'Bilaspur Chhattisgarh'),
(103, 'IND', 'Bilaspur Himachal Pradesh'),
(104, 'IND', 'Bodh Gaya '),
(105, 'IND', 'Bokaro Steel City'),
(106, 'IND', 'Bongaigaon'),
(107, 'IND', 'Brajrajnagar'),
(108, 'IND', 'Budaun '),
(109, 'IND', 'Bulandshahr '),
(110, 'IND', 'Burhanpur'),
(111, 'IND', 'Burla '),
(112, 'IND', 'Buxar'),
(113, 'IND', 'Cambay'),
(114, 'IND', 'Mithapur'),
(115, 'IND', 'Moga'),
(116, 'IND', 'Champawat'),
(117, 'IND', 'Chamrajnagar'),
(118, 'IND', 'Chandannagar'),
(119, 'IND', 'Chandigarh'),
(120, 'IND', 'Chandausi'),
(121, 'IND', 'Chapirevula'),
(122, 'IND', 'Chapra Nadia'),
(123, 'IND', 'Charkhari'),
(124, 'IND', 'Charkhi Dadri'),
(125, 'IND', 'Chandrapur'),
(126, 'IND', 'Chengalpattu'),
(127, 'IND', 'Chennai'),
(128, 'IND', 'Chhatarpur'),
(129, 'IND', 'Chhindwara'),
(130, 'IND', 'Chikmagalur'),
(131, 'IND', 'Chiplun'),
(132, 'IND', 'Chirala'),
(133, 'IND', 'Chitradurga'),
(134, 'IND', 'Chitrakoot'),
(135, 'IND', 'Chittoor'),
(136, 'IND', 'Coimbatore'),
(137, 'IND', 'Contai'),
(138, 'IND', 'Cooch Behar'),
(139, 'IND', 'Coonoor'),
(140, 'IND', 'Cuddalore'),
(141, 'IND', 'Cuddapah'),
(142, 'IND', 'Cuttack'),
(143, 'IND', 'Dabra, Gwalior'),
(144, 'IND', 'Dadri'),
(145, 'IND', 'Dahod'),
(146, 'IND', 'Dalhousie'),
(147, 'IND', 'Daltonganj'),
(148, 'IND', 'Daman'),
(149, 'IND', 'Damoh'),
(150, 'IND', 'Darbhanga'),
(151, 'IND', 'Darjeeling'),
(152, 'IND', 'Datia'),
(153, 'IND', 'Daund'),
(154, 'IND', 'Davanagere'),
(155, 'IND', 'Debagarh'),
(156, 'IND', 'Dehgam'),
(157, 'IND', 'Dehradun'),
(158, 'IND', 'Dehri'),
(159, 'IND', 'Devang'),
(160, 'IND', 'Deoghar'),
(161, 'IND', 'Deoria'),
(162, 'IND', 'Devgarh Maharashtra'),
(163, 'IND', 'Devgarh Rajasthan'),
(164, 'IND', 'Dewas'),
(165, 'IND', 'Dhamtari'),
(166, 'IND', 'Dhanbad'),
(167, 'IND', 'Dhar'),
(168, 'IND', 'Dharampur'),
(169, 'IND', 'Hanumangarh'),
(170, 'IND', 'Harda'),
(171, 'IND', 'Hardoi'),
(172, 'IND', 'Haridwar'),
(173, 'IND', 'Harsawa'),
(174, 'IND', 'Hassan'),
(175, 'IND', 'Hastinapur'),
(176, 'IND', 'Hathras'),
(177, 'IND', 'Himatnagar'),
(178, 'IND', 'Hisar'),
(179, 'IND', 'Hodal'),
(180, 'IND', 'Howrah'),
(181, 'IND', 'Hubli'),
(182, 'IND', 'Hugli chuchura'),
(183, 'IND', 'Hyderabad (Andhra Pradesh)'),
(184, 'IND', 'Ichalkaranji'),
(185, 'IND', 'Idar'),
(186, 'IND', 'Indore'),
(187, 'IND', 'Imphal'),
(188, 'IND', 'Islampur (Nalanda)'),
(189, 'IND', 'Islampur (Bihar)'),
(190, 'IND', 'Islampur (Uttar Dinajpur)'),
(191, 'IND', 'Islampur (West Bengal)'),
(192, 'IND', 'Itanagar'),
(193, 'IND', 'Jabalpur'),
(194, 'IND', 'Jagadhri'),
(195, 'IND', 'Jagdalpur'),
(196, 'IND', 'Jagraon'),
(197, 'IND', 'Jagtial'),
(198, 'IND', 'Jaipur'),
(199, 'IND', 'Jais'),
(200, 'IND', 'Jaisalmer'),
(201, 'IND', 'Jaitaran'),
(202, 'IND', 'Jalalabad (Firozpur)'),
(203, 'IND', 'Jalandhar'),
(204, 'IND', 'Jalgaon'),
(205, 'IND', 'Gujarat'),
(206, 'IND', 'Dharamsala'),
(207, 'IND', 'Dharwad'),
(208, 'IND', 'Dhenkanal'),
(209, 'IND', 'Dholka'),
(210, 'IND', 'Dhule'),
(211, 'IND', 'Dhulian'),
(212, 'IND', 'Dhuri'),
(213, 'IND', 'Dibrugarh'),
(214, 'IND', 'Dindigul'),
(215, 'IND', 'Dispur'),
(216, 'IND', 'Diu'),
(217, 'IND', 'Dombivli'),
(218, 'IND', 'Dumdum'),
(219, 'IND', 'Durg'),
(220, 'IND', 'Durgapur Chandrapur'),
(221, 'IND', 'Durgapur Maharashtra'),
(222, 'IND', 'Durgapur West Bengal'),
(223, 'IND', 'Dwarka'),
(224, 'IND', 'Ernakulam'),
(225, 'IND', 'Erode'),
(226, 'IND', 'Etah'),
(227, 'IND', 'Etawah'),
(228, 'IND', 'Eluru'),
(229, 'IND', 'Faizabad'),
(230, 'IND', 'Falna'),
(231, 'IND', 'Faridabad'),
(232, 'IND', 'Faridkot'),
(233, 'IND', 'Farrukhabad'),
(234, 'IND', 'Fatehabad Haryana'),
(235, 'IND', 'Fatehabad Madhya Pradesh'),
(236, 'IND', 'Fatehabad Agra'),
(237, 'IND', 'Fatehabad Uttar Pradesh'),
(238, 'IND', 'Fatehgarh'),
(239, 'IND', 'Fatehpur Chaurasi'),
(240, 'IND', 'Fatehpur Sikri'),
(241, 'IND', 'Fatehpur Rajasthan'),
(242, 'IND', 'Fatehpur Barabanki'),
(243, 'IND', 'Fatehpur Fatehpur'),
(244, 'IND', 'Fazilka'),
(245, 'IND', 'Firozabad'),
(246, 'IND', 'Firozpur'),
(247, 'IND', 'Gadag'),
(248, 'IND', 'Gadchiroli'),
(249, 'IND', 'Gandhidham'),
(250, 'IND', 'Gandhinagar'),
(251, 'IND', 'Gangtok'),
(252, 'IND', 'Ganjam'),
(253, 'IND', 'Gaya'),
(254, 'IND', 'Ghatampur'),
(255, 'IND', 'Ghaziabad'),
(256, 'IND', 'Ghazipur'),
(257, 'IND', 'Goa Velha'),
(258, 'IND', 'Godhra'),
(259, 'IND', 'Gondiya'),
(260, 'IND', 'Gorakhpur'),
(261, 'IND', 'Greater Noida'),
(262, 'IND', 'Gudalur Coimbatore district'),
(263, 'IND', 'Gudalur Nilgiris district'),
(264, 'IND', 'Gudalur Theni district'),
(265, 'IND', 'Gudivada'),
(266, 'IND', 'Gulbarga'),
(267, 'IND', 'Gumla'),
(268, 'IND', 'Guna'),
(269, 'IND', 'Gundlupet'),
(270, 'IND', 'Guntur'),
(271, 'IND', 'Gurgaon'),
(272, 'IND', 'Guwahati'),
(273, 'IND', 'Gwalior'),
(274, 'IND', 'Godda'),
(275, 'IND', 'Hoshiarpur '),
(276, 'IND', 'Haldia '),
(277, 'IND', 'Haldwani'),
(278, 'IND', 'Halisahar'),
(279, 'IND', 'Hamirpur (Himachal Pradesh)'),
(280, 'IND', 'Hamirpur (Uttar Pradesh)'),
(281, 'IND', 'Hansi'),
(282, 'IND', 'Jalore'),
(283, 'IND', 'Jamakhandi'),
(284, 'IND', 'Jammu'),
(285, 'IND', 'Jamnagar'),
(286, 'IND', 'Jamshedpur'),
(287, 'IND', 'Jaunpur (Uttar Pradesh)'),
(288, 'IND', 'Jhabua'),
(289, 'IND', 'Jhajjar'),
(290, 'IND', 'Jhalawar'),
(291, 'IND', 'Jhansi'),
(292, 'IND', 'Jharsuguda'),
(293, 'IND', 'Jhunjhunu'),
(294, 'IND', 'Jodhpur'),
(295, 'IND', 'Jorhat'),
(296, 'IND', 'Junagadh'),
(297, 'IND', 'Kadapa'),
(298, 'IND', 'Kailaras'),
(299, 'IND', 'Kaithal'),
(300, 'IND', 'Kakinada'),
(301, 'IND', 'Kalburgi'),
(302, 'IND', 'Kalyan'),
(303, 'IND', 'Kamthi'),
(304, 'IND', 'Kanchipuram'),
(305, 'IND', 'Kanker'),
(306, 'IND', 'Kannur'),
(307, 'IND', 'Kanpur'),
(308, 'IND', 'Kapurthala'),
(309, 'IND', 'Karad'),
(310, 'IND', 'Karaikudi'),
(311, 'IND', 'Karimganj'),
(312, 'IND', 'Karimnagar'),
(313, 'IND', 'Karur'),
(314, 'IND', 'Karwar'),
(315, 'IND', 'Katihar'),
(316, 'IND', 'Katni'),
(317, 'IND', 'Keylong'),
(318, 'IND', 'Khagaria'),
(319, 'IND', 'Khanna'),
(320, 'IND', 'Kharagpur'),
(321, 'IND', 'Khurai'),
(322, 'IND', 'Kochi(Cochin)'),
(323, 'IND', 'Kolar'),
(324, 'IND', 'Kolhapur'),
(325, 'IND', 'Kashinagar'),
(326, 'IND', 'Kollam (Formerly Quilon)'),
(327, 'IND', 'Kondagaon'),
(328, 'IND', 'Konnagar'),
(329, 'IND', 'Kota(Bilaspur)'),
(330, 'IND', 'Kota (Chhattisgarh)'),
(331, 'IND', 'Kota (Karnataka)'),
(332, 'IND', 'Kota (Rajasthan)'),
(333, 'IND', 'Kota (Uttar Pradesh)'),
(334, 'IND', 'Kotdwara'),
(335, 'IND', 'Kotma'),
(336, 'IND', 'Kottayam'),
(337, 'IND', 'Koyilandy'),
(338, 'IND', 'Kozhikode'),
(339, 'IND', 'Krishnanagar(Nadia)'),
(340, 'IND', 'Kuchinda'),
(341, 'IND', 'Kurnoo'),
(342, 'IND', 'Kurukshetra'),
(343, 'IND', 'Ladwa'),
(344, 'IND', 'Lakhisarai'),
(345, 'IND', 'Lalitpur'),
(346, 'IND', 'Lamka'),
(347, 'IND', 'Latur'),
(348, 'IND', 'Leh'),
(349, 'IND', 'Lonavla'),
(350, 'IND', 'Lucknow'),
(351, 'IND', 'Ludhiana'),
(352, 'IND', 'Machilipatnam'),
(353, 'IND', 'Madanapalle'),
(354, 'IND', 'Madgaon'),
(355, 'IND', 'Madhyamgram'),
(356, 'IND', 'Madikeri'),
(357, 'IND', 'Madurai'),
(358, 'IND', 'Mahabaleswar'),
(359, 'IND', 'Mahabubnagar'),
(360, 'IND', 'Mahad'),
(361, 'IND', 'Mahe'),
(362, 'IND', 'Mahuva (Bhavnagar district)'),
(363, 'IND', 'Mahoba'),
(364, 'IND', 'Mahuva (Surat district)'),
(365, 'IND', 'Mahwa'),
(366, 'IND', 'Malegaon'),
(367, 'IND', 'Malout'),
(368, 'IND', 'Manavadar'),
(369, 'IND', 'Mancherial'),
(370, 'IND', 'Mandla'),
(371, 'IND', 'Mandsaur'),
(372, 'IND', 'Mandya'),
(373, 'IND', 'Manesar'),
(374, 'IND', 'Mangalagiri'),
(375, 'IND', 'Mangalore'),
(376, 'IND', 'Mapusa'),
(377, 'IND', 'Marmagao'),
(378, 'IND', 'Mathura'),
(379, 'IND', 'Meerut'),
(380, 'IND', 'Mehsana'),
(381, 'IND', 'Mira-Bhayandar'),
(382, 'IND', 'Miraj'),
(383, 'IND', 'Mirzapur'),
(384, 'IND', 'Modasa'),
(385, 'IND', 'Mohali'),
(386, 'IND', 'Mohania'),
(387, 'IND', 'Mokama'),
(388, 'IND', 'Moradabad'),
(389, 'IND', 'Morshi'),
(390, 'IND', 'Motihari'),
(391, 'IND', 'Mount Abu'),
(392, 'IND', 'Mukatsar'),
(393, 'IND', 'Mullanpur (Ludhiana district)'),
(394, 'IND', 'Mullanpur (Rupnagar district)'),
(395, 'IND', 'Mumbai (formerly Bombay)'),
(396, 'IND', 'Murshidabad'),
(397, 'IND', 'Murwara'),
(398, 'IND', 'Mussoorie'),
(399, 'IND', 'Muzaffarnagar'),
(400, 'IND', 'Muzaffarpur'),
(401, 'IND', 'Mysore'),
(402, 'IND', 'Nadiad'),
(403, 'IND', 'Nagapattinam'),
(404, 'IND', 'Nagarkurnool'),
(405, 'IND', 'Nagaur'),
(406, 'IND', 'Nagercoil'),
(407, 'IND', 'Nagpur'),
(408, 'IND', 'Nainital'),
(409, 'IND', 'Nalagarh'),
(410, 'IND', 'Nalgonda'),
(411, 'IND', 'Namakkal'),
(412, 'IND', 'Nanded'),
(413, 'IND', 'Nandyal'),
(414, 'IND', 'Nandurbar'),
(415, 'IND', 'Nangal'),
(416, 'IND', 'Narasaraopet'),
(417, 'IND', 'Narnaul'),
(418, 'IND', 'Narsimhapur'),
(419, 'IND', 'Narsinghgarh (Damoh district)'),
(420, 'IND', 'Narsinghgarh (Rajgarh district)'),
(421, 'IND', 'Narsingarh (Tripura)'),
(422, 'IND', 'Nashik'),
(423, 'IND', 'Navi Mumbai'),
(424, 'IND', 'Navsari'),
(425, 'IND', 'Nawalgarh (Rajasthan)'),
(426, 'IND', 'Nawanshahr'),
(427, 'IND', 'Neemuch'),
(428, 'IND', 'Nellore'),
(429, 'IND', 'New Delhi'),
(430, 'IND', 'New Guntur'),
(431, 'IND', 'Noida'),
(432, 'IND', 'New Guntur'),
(433, 'IND', 'New Okhla Industrial Development Authority|NOIDA'),
(434, 'IND', 'Nizamabad (Andhra Pradesh)'),
(435, 'IND', 'Nizamabad (Uttar Pradesh)'),
(436, 'IND', 'Noorpur (Uttar Pradesh)'),
(437, 'IND', 'Nuzvid'),
(438, 'IND', 'Ongole'),
(439, 'IND', 'Ootacamund (Ooty)'),
(440, 'IND', 'Orai'),
(441, 'IND', 'Padampur'),
(442, 'IND', 'Palai'),
(443, 'IND', 'Palakkad'),
(444, 'IND', 'Palanpur'),
(445, 'IND', 'Pali (Rajasthan)'),
(446, 'IND', 'Palwal'),
(447, 'IND', 'Panaji'),
(448, 'IND', 'Panchkula'),
(449, 'IND', 'Pandharpur'),
(450, 'IND', 'Panipat'),
(451, 'IND', 'Panna'),
(452, 'IND', 'Panvel'),
(453, 'IND', 'Paratwada'),
(454, 'IND', 'Patan'),
(455, 'IND', 'Pathanamthitta'),
(456, 'IND', 'Pathankot'),
(457, 'IND', 'Patiala'),
(458, 'IND', 'Patna'),
(459, 'IND', 'Patratu'),
(460, 'IND', 'Phaltan'),
(461, 'IND', 'Piduguralla'),
(462, 'IND', 'Pilibhit'),
(463, 'IND', 'Pimpri Chinchwad'),
(464, 'IND', 'Pithoragarh'),
(465, 'IND', 'Pokaran'),
(466, 'IND', 'Pollachi'),
(467, 'IND', 'Ponda'),
(468, 'IND', 'Pondicherry'),
(469, 'IND', 'Porbandar'),
(470, 'IND', 'Port Blair'),
(471, 'IND', 'Pratapgarh (Rajasthan)'),
(472, 'IND', 'Pratapgarh (Tripura)'),
(473, 'IND', 'Pratapgarh (Uttar Pradesh)'),
(474, 'IND', 'Pudukkottai'),
(475, 'IND', 'Punalur'),
(476, 'IND', 'Pune'),
(477, 'IND', 'Puri (Orissa)'),
(478, 'IND', 'Purnia'),
(479, 'IND', 'Purulia'),
(480, 'IND', 'Pushkar'),
(481, 'IND', 'Qazigund '),
(482, 'IND', 'Rae Bareli'),
(483, 'IND', 'Raichur'),
(484, 'IND', 'Raigarh'),
(485, 'IND', 'Raipur'),
(486, 'IND', 'Rairangpur'),
(487, 'IND', 'Raisen'),
(488, 'IND', 'Rajahmundry'),
(489, 'IND', 'Rajampet'),
(490, 'IND', 'Rajapalayam'),
(491, 'IND', 'Rajgangpur'),
(492, 'IND', 'Rajgarh (Alwar district)'),
(493, 'IND', 'Rajgarh (Churu district)'),
(494, 'IND', 'Dhar district'),
(495, 'IND', 'Rajgarh (Himachal Pradesh)'),
(496, 'IND', 'Rajgarh (Madhya Pradesh)'),
(497, 'IND', 'Rajgir'),
(498, 'IND', 'Rajgir'),
(499, 'IND', 'Rajkot'),
(500, 'IND', 'Rajnandgaon'),
(501, 'IND', 'Ram Garh'),
(502, 'IND', 'Ramanagara'),
(503, 'IND', 'Ramanathapuram'),
(504, 'IND', 'Ramapuram (Kottayam)'),
(505, 'IND', 'Ramapuram (Malappuram)'),
(506, 'IND', 'Rameshwaram'),
(507, 'IND', 'Ramgarh Cantonment'),
(508, 'IND', 'Ramgarh (Rajasthan)'),
(509, 'IND', 'Ramgarh (Uttarakhand)'),
(510, 'IND', 'Ramnagar (Agartala)'),
(511, 'IND', 'Ramnagar (Kulti)'),
(512, 'IND', 'Ramnagar (Barabanki)'),
(513, 'IND', 'Ramnagar (Paschim Champaran)'),
(514, 'IND', 'Ramnagar (Pandaveswar)'),
(515, 'IND', 'Ramnagar (Udhampur)'),
(516, 'IND', 'Ramnagar (Madhya Pradesh)'),
(517, 'IND', 'Ramnagar (Purba Medinipur district)'),
(518, 'IND', 'Ramnagar (Uttarakhand)'),
(519, 'IND', 'Ramnagar (Varanasi)'),
(520, 'IND', 'Rampur Bhawanipur'),
(521, 'IND', 'Rampur Karkhana'),
(522, 'IND', 'Rampur Maniharan'),
(523, 'IND', 'Rampur Naikin'),
(524, 'IND', 'Rampur (Himachal Pradesh)'),
(525, 'IND', 'Rampur (Jharkhand)'),
(526, 'IND', 'Rampur (Uttar Pradesh)'),
(527, 'IND', 'Ranaghat'),
(528, 'IND', 'Ranchi'),
(529, 'IND', 'Rani (Rajasthan)'),
(530, 'IND', 'Ranikhet'),
(531, 'IND', 'Ratangarh (Neemuch)'),
(532, 'IND', 'Ratangarh (Churu)'),
(533, 'IND', 'Ratlam'),
(534, 'IND', 'Ratnagiri'),
(535, 'IND', 'Ravulapalem'),
(536, 'IND', 'Renukoot'),
(537, 'IND', 'Rewari'),
(538, 'IND', 'Rishikesh'),
(539, 'IND', 'Rishra'),
(540, 'IND', 'Roorkee'),
(541, 'IND', 'Rourkela'),
(542, 'IND', 'Sadri'),
(543, 'IND', 'Sagar (Madhya Pradesh)'),
(544, 'IND', 'Sagara (Karnataka)'),
(545, 'IND', 'Saharanpur'),
(546, 'IND', 'Salem (Tamil Nadu)'),
(547, 'IND', 'Samastipur'),
(548, 'IND', 'Sambalpur'),
(549, 'IND', 'Sanawad'),
(550, 'IND', 'Sanchore'),
(551, 'IND', 'Sangli'),
(552, 'IND', 'Sangamner'),
(553, 'IND', 'Sangrur'),
(554, 'IND', 'Sardarshahar'),
(555, 'IND', 'Sathyamangalam'),
(556, 'IND', 'Satara'),
(557, 'IND', 'Satna'),
(558, 'IND', 'Sehore'),
(559, 'IND', 'Seohara'),
(560, 'IND', 'Seoni'),
(561, 'IND', 'Shahada (Maharashtra)'),
(562, 'IND', 'Shajapur'),
(563, 'IND', 'Shegaon'),
(564, 'IND', 'Sheopur'),
(565, 'IND', 'Shevgaon'),
(566, 'IND', 'Shillong'),
(567, 'IND', 'Shimla'),
(568, 'IND', 'Shimoga'),
(569, 'IND', 'Shirala'),
(570, 'IND', 'Shivani (Tarikere)'),
(571, 'IND', 'Solan'),
(572, 'IND', 'Sholapur'),
(573, 'IND', 'Shrigonda'),
(574, 'IND', 'Shrirampur'),
(575, 'IND', 'Shrivardhan'),
(576, 'IND', 'Siddipet'),
(577, 'IND', 'Sidhpur'),
(578, 'IND', 'Sihor'),
(579, 'IND', 'Sikar'),
(580, 'IND', 'Silchar'),
(581, 'IND', 'Siliguri'),
(582, 'IND', 'Silvassa'),
(583, 'IND', 'Sindhanur'),
(584, 'IND', 'Sinnar'),
(585, 'IND', 'Sitapur'),
(586, 'IND', 'Singrauli'),
(587, 'IND', 'Sirohi'),
(588, 'IND', 'Sironj'),
(589, 'IND', 'Sirsa (Haryana)'),
(590, 'IND', 'Sirsa (Uttar Pradesh)'),
(591, 'IND', 'Sitamarhi'),
(592, 'IND', 'Sivakasi'),
(593, 'IND', 'Siwan (Bihar)'),
(594, 'IND', 'Sojat'),
(595, 'IND', 'Sonipat'),
(596, 'IND', 'Ganganagar (Sriganganagar)'),
(597, 'IND', 'Srikakulam'),
(598, 'IND', 'Srikalahasti'),
(599, 'IND', 'Srinagar'),
(600, 'IND', 'Surat'),
(601, 'IND', 'Sumerpur'),
(602, 'IND', 'Suratgarh'),
(603, 'IND', 'Surendranagar'),
(604, 'IND', 'Suri (Birbhum)'),
(605, 'IND', 'Suryapet'),
(606, 'IND', 'Secundrabad'),
(607, 'IND', 'Takhatgarh'),
(608, 'IND', 'Talwara'),
(609, 'IND', 'Tamluk'),
(610, 'IND', 'Tandur'),
(611, 'IND', 'Tanuku'),
(612, 'IND', 'Tenali'),
(613, 'IND', 'Tezpur'),
(614, 'IND', 'Thalassery'),
(615, 'IND', 'Thane'),
(616, 'IND', 'Thanjavur'),
(617, 'IND', 'Thathawata'),
(618, 'IND', 'Thirthahalli'),
(619, 'IND', 'Thiruvallur'),
(620, 'IND', 'Thiruvananthapuram'),
(621, 'IND', 'Thrikkannamangal'),
(622, 'IND', 'Thrissur'),
(623, 'IND', 'Thodupuzha'),
(624, 'IND', 'Thoothukudi'),
(625, 'IND', 'Tikamgarh'),
(626, 'IND', 'Tindivanam'),
(627, 'IND', 'Tinsukia'),
(628, 'IND', 'Tirthahalli'),
(629, 'IND', 'Tiruchengode'),
(630, 'IND', 'Tiruchirappalli'),
(631, 'IND', 'Tirunelveli'),
(632, 'IND', 'Tirupati '),
(633, 'IND', 'Tirupattur'),
(634, 'IND', 'Tirupur'),
(635, 'IND', 'Tiruvalla'),
(636, 'IND', 'Tiruvannamalai'),
(637, 'IND', 'Tiruvarur'),
(638, 'IND', 'Tumkur'),
(639, 'IND', 'Udaipur (Rajasthan)'),
(640, 'IND', 'Udaipur (Tripura)'),
(641, 'IND', 'Udgir'),
(642, 'IND', 'Udhagamandalam'),
(643, 'IND', 'Udhampur'),
(644, 'IND', 'Udupi'),
(645, 'IND', 'Ujjain'),
(646, 'IND', 'Ulhasnagar'),
(647, 'IND', 'Umred'),
(648, 'IND', 'Unnao'),
(649, 'IND', 'Uran Islampur'),
(650, 'IND', 'Uttarpara'),
(651, 'IND', 'Vadodara'),
(652, 'IND', 'Vatakara'),
(653, 'IND', 'Vallabh Vidhyanagar'),
(654, 'IND', 'Valsad'),
(655, 'IND', 'Vandavasi'),
(656, 'IND', 'Vapi'),
(657, 'IND', 'Varanasi'),
(658, 'IND', 'Vasai'),
(659, 'IND', 'Vasco da Gama(Goa)'),
(660, 'IND', 'Vellore'),
(661, 'IND', 'Vidisha'),
(662, 'IND', 'Vijayawada'),
(663, 'IND', 'Viluppuram'),
(664, 'IND', 'Virar'),
(665, 'IND', 'Visakhapatnam'),
(666, 'IND', 'Vizianagaram'),
(667, 'IND', 'Virudhachalam'),
(668, 'IND', 'Vyara]'),
(669, 'IND', 'Wadi'),
(670, 'IND', 'Warangal'),
(671, 'IND', 'Wardha'),
(672, 'IND', 'Yamunanagar'),
(673, 'IND', 'Yavatmal'),
(674, 'IND', 'Zira '),
(675, 'IND', 'Ziro'),
(677, 'AFG', 'Kandahar'),
(678, 'BNG', 'Dhaka'),
(679, 'BNG', 'Khulna'),
(680, 'BNG', 'Pabna'),
(681, 'BNG', 'Jashore'),
(682, 'BNG', 'Chattagram'),
(683, 'IND', 'Hooghly Serampore');

-- --------------------------------------------------------

--
-- Table structure for table `pg_qualification`
--

CREATE TABLE `pg_qualification` (
  `pg_qualification_id` int(11) NOT NULL,
  `pg_qualification` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pg_qualification`
--

INSERT INTO `pg_qualification` (`pg_qualification_id`, `pg_qualification`) VALUES
(1, 'Select From table'),
(2, 'M.TECH'),
(3, 'MA'),
(4, 'MSC'),
(5, 'MBA'),
(6, 'MCA'),
(7, 'MCOM'),
(8, 'Post Graduate Diploma'),
(9, 'PGDMA'),
(10, 'PGDCA'),
(11, 'Not Done');

-- --------------------------------------------------------

--
-- Table structure for table `professional_registration`
--

CREATE TABLE `professional_registration` (
  `id` int(10) NOT NULL,
  `professional_full_name` varchar(45) DEFAULT NULL,
  `professional_email_id` varchar(45) NOT NULL,
  `professional_mobile_number` varchar(20) NOT NULL,
  `professional_password` varchar(20) DEFAULT NULL,
  `professional_gender` varchar(10) DEFAULT NULL,
  `professional_organisation_name` varchar(100) DEFAULT NULL,
  `professional_designation` varchar(45) DEFAULT NULL,
  `professional_location` varchar(45) DEFAULT NULL,
  `professional_nationality` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `professional_registration`
--

INSERT INTO `professional_registration` (`id`, `professional_full_name`, `professional_email_id`, `professional_mobile_number`, `professional_password`, `professional_gender`, `professional_organisation_name`, `professional_designation`, `professional_location`, `professional_nationality`) VALUES
(1, 'Rishita Maity', 'r@gmail.com', '44444444444', '1234', 'on', 'PCS', 'SD', 'KOL', 'AUS'),
(2, 'james Bond', 'dobawe7750@timothyjsilverman.com', '3341067284', '3341067284', 'on', 'qwr', 'qwe', 'qwe', 'ZAM');

-- --------------------------------------------------------

--
-- Table structure for table `student_registration`
--

CREATE TABLE `student_registration` (
  `id` int(11) NOT NULL,
  `student_name` varchar(245) NOT NULL,
  `student_email` varchar(100) NOT NULL,
  `student_mobile` varchar(20) NOT NULL,
  `student_password` varchar(45) NOT NULL,
  `student_gender` varchar(10) DEFAULT NULL,
  `student_heighest_qualification` varchar(45) DEFAULT NULL,
  `student_university` varchar(45) DEFAULT NULL,
  `student_location` varchar(45) DEFAULT NULL,
  `student_nationalty` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_registration`
--

INSERT INTO `student_registration` (`id`, `student_name`, `student_email`, `student_mobile`, `student_password`, `student_gender`, `student_heighest_qualification`, `student_university`, `student_location`, `student_nationalty`) VALUES
(1, 'Aswini Guptaji ', 'aswini@gmail.com', '1111111111', '1234', 'male', '2', '7', '320', 'IND'),
(2, 'Anusree', 'anusree@gmail.com', '2222222222', '1234', 'female', '2', '16', '12', 'ARM'),
(3, 'Alok Haider', 'alok@gmail.com', '8765432123', '1234', 'male', '4', '19', '260', 'IND'),
(4, 'Priya Ghosh', 'null', '8143473533', '1234', 'female', '3', '15', '16', 'IND'),
(5, 'Priya Ghosh', 'pg@gmail.com', '8145673533', '1234', 'male', '9', '19', '19', 'ICF'),
(6, 'james bond', 'dobawe7750@timothyjsilverman.com', '3341067284', '123456789', 'female', '2', '6', '1', 'IND');

-- --------------------------------------------------------

--
-- Table structure for table `university_institute`
--

CREATE TABLE `university_institute` (
  `COUNTRY_CODE` varchar(4) DEFAULT NULL,
  `LOCATION_ID` int(11) DEFAULT NULL,
  `UNIVERSITY_INSTITUTE_ID` int(11) NOT NULL,
  `UNIVERSITY_INSTITUTE_NAME` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `university_institute`
--

INSERT INTO `university_institute` (`COUNTRY_CODE`, `LOCATION_ID`, `UNIVERSITY_INSTITUTE_ID`, `UNIVERSITY_INSTITUTE_NAME`) VALUES
('IND', 1, -1, '-: Select Board/University ;-'),
('IND', 1, 1, 'Calcutta University'),
('IND', 1, 2, 'Jadavpur University'),
('IND', 1, 3, 'Rabindrabharati University'),
('IND', 1, 4, 'Burdwan University'),
('IND', 1, 5, 'Vidyasagar University'),
('IND', 1, 6, 'North Bengal University'),
('IND', 1, 7, 'West Bengal University Of Technology'),
('IND', 1, 8, 'Barasat University'),
('IND', 1, 9, 'IGNOU'),
('IND', 1, 10, 'Sikkim Manipal University'),
('IND', 528, 11, 'Ranchi University'),
('IND', 1, 12, 'Agra University'),
('IND', 1, 13, 'AIMA'),
('IND', 1, 14, 'Aligarh Muslim University'),
('IND', 1, 15, 'Allahabad University'),
('IND', 1, 16, 'Amaravati University'),
('IND', 1, 17, 'Amity Business School'),
('IND', 1, 18, 'Andhra University'),
('IND', 1, 19, 'Anna University'),
('IND', 1, 20, 'Annamalai University'),
('IND', 1, 21, 'Apeejay School of Marketing'),
('IND', 1, 22, 'APTECH'),
('IND', 1, 23, 'Banaras Hindu University'),
('IND', 1, 24, 'Bangalore University'),
('IND', 1, 25, 'Barkatullah University'),
('IND', 1, 26, 'Berhampur University'),
('IND', 1, 27, 'Bharathiar University'),
('IND', 1, 28, 'Bharathidasan University'),
('IND', 1, 29, 'BITS (Mesra)'),
('IND', 1, 30, 'BITS (Pilani)'),
('IND', 1, 31, 'Board of Technical Education'),
('IND', 1, 32, 'Calicut University'),
('IND', 1, 33, 'Chennai University'),
('IND', 1, 34, 'DAVV, Indore'),
('IND', 1, 35, 'Delhi College of Engineering'),
('IND', 1, 36, 'Delhi University'),
('IND', 1, 37, 'Devi Ahilya University'),
('IND', 1, 38, 'DOEACC'),
('IND', 1, 39, 'FMS,Delhi'),
('IND', 1, 40, 'Fore School of Management'),
('IND', 1, 41, 'Goa Institute of Management'),
('IND', 1, 42, 'Goa University'),
('IND', 1, 43, 'Gujarat University'),
('IND', 1, 44, 'Gulbarga University'),
('IND', 1, 45, 'Hyderabad University'),
('IND', 1, 46, 'ICFAI'),
('IND', 1, 47, 'ICSI'),
('IND', 1, 48, 'ICWA'),
('IND', 1, 49, 'IIM, Ahmedabad'),
('IND', 1, 50, 'IIM, Bangalore'),
('IND', 1, 51, 'IIM, Calcutta'),
('IND', 1, 52, 'IIM, Indore'),
('IND', 1, 53, 'IIM, Kozhikode'),
('IND', 1, 54, 'IIM, Lucknow'),
('IND', 1, 55, 'IIPM'),
('IND', 1, 56, 'IISWBM, Calcutta'),
('IND', 1, 57, 'IIT,Chennai'),
('IND', 1, 58, 'IIT,Delhi'),
('IND', 1, 59, 'IIT,Guwahati'),
('IND', 1, 60, 'IIT,Kanpur'),
('IND', 1, 61, 'IIT,Kharagpur'),
('IND', 1, 62, 'IIT,Mumbai'),
('IND', 1, 63, 'IIT,Roorkee'),
('IND', 1, 64, 'IMI, Delhi'),
('IND', 1, 65, 'IMT,Ghaziabad'),
('IND', 1, 66, 'Indian Institute of Foreign Trade'),
('IND', 1, 67, 'Indian Institute of Science'),
('IND', 1, 68, 'Indian Statistical Institute'),
('IND', 1, 69, 'Institute of Chartered Accountants of India'),
('IND', 1, 70, 'IRM, Anand'),
('IND', 1, 71, 'IT,BHU'),
('IND', 1, 72, 'Jamia Millia Islamia'),
('IND', 1, 73, 'Jawaharlal Nehru University'),
('IND', 1, 74, 'Jiwaji University'),
('IND', 1, 75, 'JNTU,Hyderabad'),
('IND', 1, 76, 'Kakatiya University'),
('IND', 1, 77, 'Kanpur University'),
('IND', 1, 78, 'Karanataka University'),
('IND', 1, 79, 'Kerala University'),
('IND', 1, 80, 'Kurukshetra University'),
('IND', 1, 81, 'Kuvempu University'),
('IND', 1, 82, 'Lucknow University'),
('IND', 1, 83, 'Madurai Kamaraj University'),
('IND', 1, 84, 'Mahatma Gandhi University'),
('IND', 1, 85, 'Mangalore University'),
('IND', 1, 86, 'MDI,Gurgaon'),
('IND', 1, 87, 'Meerut University'),
('IND', 1, 88, 'Mumbai University'),
('IND', 1, 89, 'Nagarjuna University'),
('IND', 1, 90, 'Nagpur University'),
('IND', 1, 91, 'NIFT'),
('IND', 1, 92, 'NIIT'),
('IND', 1, 93, 'NMIMS,Mumbai'),
('IND', 1, 94, 'North Maharashtra University'),
('IND', 1, 95, 'OSMANIA UNIVERSITY'),
('IND', 1, 96, 'Panjab University'),
('IND', 1, 97, 'Pondicherry University'),
('IND', 1, 98, 'Pune University'),
('IND', 1, 99, 'Punjab Technical University'),
('IND', 1, 100, 'Rajasthan University'),
('IND', 1, 101, 'Ranchi University'),
('IND', 1, 102, 'RECs'),
('IND', 1, 103, 'Sambalpur University'),
('IND', 1, 104, 'Saurashtra University'),
('IND', 1, 105, 'Shivaji University'),
('IND', 1, 106, 'South Gujarat University,Surat'),
('IND', 1, 107, 'SP Jain Institute of Management Studies'),
('IND', 1, 108, 'Sri Venkateshwara University'),
('IND', 1, 109, 'Symbiosis,Pune'),
('IND', 1, 110, 'TA Pai Management Institute'),
('IND', 1, 111, 'Tata Institute of Social Sciences'),
('IND', 1, 112, 'University of Mysore'),
('IND', 1, 113, 'Utkal University'),
('IND', 1, 114, 'Vidyasagar University'),
('IND', 1, 115, 'Visveshwaraiah University'),
('IND', 1, 116, 'XIM, Bhubaneswar'),
('IND', 1, 117, 'XISS,  Ranchi'),
('IND', 1, 118, 'XLRI, Jamshedpur'),
('IND', 1, 119, 'YMCA'),
('IND', NULL, 120, 'Kalyani University'),
('IND', 458, 121, 'Patna University'),
(NULL, NULL, 122, 'Chartered Accountants Institute'),
('9997', NULL, 9997, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `user_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `user_name`, `user_email`, `user_password`, `user_type`) VALUES
(1, 'Aswini Guptaji ', 'aswini@gmail.com', '1234', '1'),
(2, 'Anusree', 'anusree@gmail.com', '1234', '1'),
(3, 'Sarada Das', 's@gmail.com', 's@gmail.com', '3'),
(4, 'Rishita Maity', 'r@gmail.com', 'r@gmail.com', '3'),
(5, 'Manish Halder', 'manish@gmail.com', '1234', '2'),
(6, 'Alok Haider', 'alok@gmail.com', '1234', '1'),
(7, 'Priya Ghosh', 'null', '1234', '1'),
(8, 'Priya Ghosh', 'pg@gmail.com', '1234', '1'),
(9, 'Arit Saha', 'arit@gmail.com', '1234', '2'),
(10, 'james Bond', 'dobawe7750@timothyjsilverman.com', '3341067284', '3'),
(11, 'james bond', 'dobawe7750@timothyjsilverman.com', '123456789', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user_table`
--
ALTER TABLE `admin_user_table`
  ADD PRIMARY KEY (`id`,`admin_email`,`admin_mobile`),
  ADD UNIQUE KEY `admin_email_UNIQUE` (`admin_email`),
  ADD UNIQUE KEY `admin_mobile_UNIQUE` (`admin_mobile`);

--
-- Indexes for table `associate_registration`
--
ALTER TABLE `associate_registration`
  ADD PRIMARY KEY (`id`,`associate_email`,`associate_mobile`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `code_number`
--
ALTER TABLE `code_number`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `country_name`
--
ALTER TABLE `country_name`
  ADD PRIMARY KEY (`COUNTRY_CODE`);

--
-- Indexes for table `course_category_master`
--
ALTER TABLE `course_category_master`
  ADD PRIMARY KEY (`course_id`,`course_code`),
  ADD UNIQUE KEY `course_id_UNIQUE` (`course_id`),
  ADD UNIQUE KEY `course_code_UNIQUE` (`course_code`);

--
-- Indexes for table `course_content`
--
ALTER TABLE `course_content`
  ADD PRIMARY KEY (`course_id`,`course_content_code`),
  ADD UNIQUE KEY `course_content_code_UNIQUE` (`course_content_code`),
  ADD KEY `fkey_course_code_content_idx` (`course_code`);

--
-- Indexes for table `course_detail_catagory`
--
ALTER TABLE `course_detail_catagory`
  ADD PRIMARY KEY (`course_id`,`course_detail_code`),
  ADD UNIQUE KEY `course_detail_code_UNIQUE` (`course_detail_code`),
  ADD KEY `fkey_course_code_details_idx` (`course_code`);

--
-- Indexes for table `course_sub_catagory`
--
ALTER TABLE `course_sub_catagory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_sub_catagory_code_UNIQUE` (`course_sub_catagory_code`),
  ADD KEY `fkey_course_code_idx` (`course_code`);

--
-- Indexes for table `lectures_playlist`
--
ALTER TABLE `lectures_playlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `course_detail_code_UNIQUE` (`course_detail_code`),
  ADD KEY `fkey_course_detail_code_idx` (`course_detail_code`);

--
-- Indexes for table `location_name`
--
ALTER TABLE `location_name`
  ADD PRIMARY KEY (`LOCATION_ID`),
  ADD KEY `FK_LOCATION_NAME_COUNTRY_CODE` (`COUNTRY_CODE`);

--
-- Indexes for table `pg_qualification`
--
ALTER TABLE `pg_qualification`
  ADD PRIMARY KEY (`pg_qualification_id`);

--
-- Indexes for table `professional_registration`
--
ALTER TABLE `professional_registration`
  ADD PRIMARY KEY (`id`,`professional_email_id`,`professional_mobile_number`);

--
-- Indexes for table `student_registration`
--
ALTER TABLE `student_registration`
  ADD PRIMARY KEY (`id`,`student_email`,`student_mobile`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `student_email_UNIQUE` (`student_email`),
  ADD UNIQUE KEY `student_mobile_UNIQUE` (`student_mobile`);

--
-- Indexes for table `university_institute`
--
ALTER TABLE `university_institute`
  ADD PRIMARY KEY (`UNIVERSITY_INSTITUTE_ID`),
  ADD KEY `FK_UNIVERSITY_INST_COUNTRY_CODE` (`COUNTRY_CODE`),
  ADD KEY `FK_UNIVERSITY_INST_LOCATION_ID` (`LOCATION_ID`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`,`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user_table`
--
ALTER TABLE `admin_user_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `associate_registration`
--
ALTER TABLE `associate_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `code_number`
--
ALTER TABLE `code_number`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_category_master`
--
ALTER TABLE `course_category_master`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `course_content`
--
ALTER TABLE `course_content`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `course_detail_catagory`
--
ALTER TABLE `course_detail_catagory`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `course_sub_catagory`
--
ALTER TABLE `course_sub_catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `lectures_playlist`
--
ALTER TABLE `lectures_playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `location_name`
--
ALTER TABLE `location_name`
  MODIFY `LOCATION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=684;

--
-- AUTO_INCREMENT for table `pg_qualification`
--
ALTER TABLE `pg_qualification`
  MODIFY `pg_qualification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `professional_registration`
--
ALTER TABLE `professional_registration`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_registration`
--
ALTER TABLE `student_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `university_institute`
--
ALTER TABLE `university_institute`
  MODIFY `UNIVERSITY_INSTITUTE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9998;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_sub_catagory`
--
ALTER TABLE `course_sub_catagory`
  ADD CONSTRAINT `fkey_course_code` FOREIGN KEY (`course_code`) REFERENCES `course_category_master` (`course_code`);

--
-- Constraints for table `lectures_playlist`
--
ALTER TABLE `lectures_playlist`
  ADD CONSTRAINT `fkey_course_detail_code` FOREIGN KEY (`course_detail_code`) REFERENCES `course_detail_catagory` (`course_detail_code`);

--
-- Constraints for table `location_name`
--
ALTER TABLE `location_name`
  ADD CONSTRAINT `FK_LOCATION_NAME_COUNTRY_CODE` FOREIGN KEY (`COUNTRY_CODE`) REFERENCES `country_name` (`COUNTRY_CODE`);

--
-- Constraints for table `university_institute`
--
ALTER TABLE `university_institute`
  ADD CONSTRAINT `FK_UNIVERSITY_INST_COUNTRY_CODE` FOREIGN KEY (`COUNTRY_CODE`) REFERENCES `country_name` (`COUNTRY_CODE`),
  ADD CONSTRAINT `FK_UNIVERSITY_INST_LOCATION_ID` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location_name` (`LOCATION_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
