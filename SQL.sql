CREATE DATABASE TD-LTE
ON PRIMARY
  ( NAME='TD-LTE_Primary',
    FILENAME=
       'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\data\TD-LTE_Prm.mdf',
    SIZE=50MB,
    MAXSIZE=100MB,
    FILEGROWTH=1MB),
FILEGROUP TD-LTE_FG1
  ( NAME = 'TD-LTE_FG1_Dat1',
    FILENAME =
       'D:\SQL server\脚本\data\TD-LTE_FG1_1.ndf ',
    SIZE = 30MB,
    MAXSIZE=50MB,
    FILEGROWTH=1MB),
  ( NAME = 'TD-LTE_FG1_Dat2',
    FILENAME =
	   'D:\SQL server\脚本\data\TD-LTE_FG1_2.ndf ',
    SIZE = 30MB,
    MAXSIZE=50MB,
    FILEGROWTH=1MB)
LOG ON
  ( NAME='TD-LTE_log',
    FILENAME =
		'E:\sql-log\data\TD-LTE.ldf',
    SIZE=10MB,
    MAXSIZE=20MB,
    FILEGROWTH=1MB);
GO

use TD-LTE
go
create table tbCell(
	CITY nvarchar(255) null,
	SECTOR_ID nvarchar(50) not null,
	SECTOR_NAME nvarchar(255) not null,
	EARFCN int not null
	constraint EARFCN_tbCell check (EARFCN in (38350,38400,38098,38100,37900,37902,40936,40938,40940,38950,39052,39148,39250,38496,38544)),
	PCI int null
	constraint PCI_tbCell check (PCI is null or (PCI between 0 and 503)),
	PSS int null
	constraint PSS_tbCell check (PSS is null or (PSS in (0,1,2))),
	SSS int null
	constraint SSS_tbCell check (SSS is null or (SSS between 0 and 167)),
	TAC int null,
	AZIMUTH float not null,
	HEIGHT float null,
	ELECTTILT float null,
	MECHTILT float null,
	TOTLETILT float not null,
	ENODEBID int not null,
	ENODEB_NAME nvarchar(255) not null,
	VENDOR nvarchar(255) null
	constraint VENDOR_tbCell check(VENDOR is null or (VENDOR in('华为','中兴','诺西','爱立信','贝尔','大唐'))),
	LONGITUDE float not null
	constraint LONGITUDE_tbCell check (LONGITUDE between -180.00000 and 180.00000),
	LATITUDE float not null
	constraint LATITUDE_tbCell check (LATITUDE between -90.00000 and 90.00000),
	style nvarchar(255) null
	constraint STYLE_tbCell check (STYLE is null or (STYLE in ('宏站','室内','室外','室分'))),
	primary key(SECTOR_ID)
)
CREATE NONCLUSTERED INDEX IX_tbCell ON tbCell (SECTOR_NAME)

create table tbOptCell(
	SECTOR_ID nvarchar(50) not null,
	EARFCN int null
	constraint EARFCN_tbOptCell check (EARFCN in (38350,38400,38098,38100,37900,37902,40936,40938,40940,38950,39052,39148,39250,38496,38544)),
	CELL_TYPE nvarchar(50) null
	constraint CELL_TYPE_tbOptCell check (CELL_TYPE is null or (CELL_TYPE in ('优化区','保护带'))),
	primary key(SECTOR_ID)
)

create table tbAdjCell(
	S_SECTOR_ID nvarchar(50) not null,
	N_SECTOR_ID nvarchar(50) not null,
	S_EARFCN int null
	constraint S_EARFCN_tbAdjCel check (S_EARFCN in (38350,38400,38098,38100,37900,37902,40936,40938,40940,38950,39052,39148,39250,38496,38544)),
	N_EARFCN int null
	constraint N_EARFCN_tbAdjCel check (N_EARFCN in (38350,38400,38098,38100,37900,37902,40936,40938,40940,38950,39052,39148,39250,38496,38544)),
	primary key(S_SECTOR_ID,N_SECTOR_ID)
)

create table tbSecAdjCell(
	S_SECTOR_ID varchar(50) not null,
	N_SECTOR_ID varchar(50) not null,
	primary key(S_SECTOR_ID,N_SECTOR_ID)
)
create table tbPCIAssignment(
	ASSIGN_ID smallint identity(1,1),
	EARFCN int null
	constraint EARFCN_tbPCIAssignment check (EARFCN in (38350,38400,38098,38100,37900,37902,40936,40938,40940,38950,39052,39148,39250,38496,38544)),
	SECTOR_ID nvarchar(200) not null,
	SECTOR_NAME nvarchar(200) null,
	ENBODEB_ID int null,
	PCI int null,
	PSS int null,
	constraint PSS_tbPCIAssignment check(PSS=PCI%3),
	SSS int null,
	constraint SSS_tbPCIAssignment check(SSS=PCI/3),
	LONGITUDE float null,
	LATITUDE float null,
	style varchar(50)null
	constraint STYLE_tbPCIAssignment check (STYLE is null or (STYLE in ('宏站','室内','室外'))),
	OPT_DATETIME datetime null default getdate(),
	primary key(ASSIGN_ID,SECTOR_ID)

)

create table tbATUData(
	seq bigint not null,
	FileName nvarchar(255) not null,
	Time varchar(100),
	Longitude float,
	Latitude float,
	CellID nvarchar(50),
	TAC int,
	EARFCN int,
	PCI smallint,
	RSRP float,
	RS_SINR float,
	NCell_ID_1 nvarchar(50),
	NCell_EARFCN_1 int,
	NCell_PCI_1 smallint,
	NCell_RSRP_1 float,
	NCell_ID_2 nvarchar(50),
	NCell_EARFCN_2 int,
	NCell_PCI_2 smallint,
	NCell_RSRP_2 float,
	NCell_ID_3 nvarchar(50),
	NCell_EARFCN_3 int,
	NCell_PCI_3 smallint,
	NCell_RSRP_3 float,
	NCell_ID_4 nvarchar(50),
	NCell_EARFCN_4 int,
	NCell_PCI_4 smallint,
	NCell_RSRP_4 float,
	NCell_ID_5 nvarchar(50),
	NCell_EARFCN_5 int,
	NCell_PCI_5 smallint,
	NCell_RSRP_5 float,
	NCell_ID_6 nvarchar(50),
	NCell_EARFCN_6 int,
	NCell_PCI_6 smallint,
	NCell_RSRP_6 float,
	primary key(seq,FileName)
)

create table tbATUC2I(
	SECTOR_ID nvarchar(50) not null,
	NCELL_ID nvarchar(50)not null,
	RATIO_ALL float,
	RANK int,
	COSITE tinyint
	constraint COSITE_tbATUC2I check (COSITE is null or (COSITE in (0,1))),
	primary key(SECTOR_ID,NCELL_ID)
)

create table tbATUHandOver(
	SSECTOR_ID nvarchar(50),
	NSECTOR_ID varchar(50),
	HOATT int
)

create table tbMROData(
	TimeStamp nvarchar(30) not null,
	ServingSector nvarchar(50) not null,
	InterferingSector nvarchar(50) not null,
	LteScRSRP float,
	LteNcRSRP float,
	LteNcEarfcn int,
	LteNcPci smallint
	foreign key(ServingSector) references tbCell(SECTOR_ID)
)
CREATE NONCLUSTERED INDEX IX_tbMROData ON tbMROData (ServingSector,InterferingSector)

create table tbC2I(
	CITY nvarchar(255),
	SCELL nvarchar(255) not null,
	NCELL nvarchar(255) not null,
	PrC2I9 float,
	C2I_Mean float,
	Std float,
	SampleCount float,
	WeightedC2I float,
	foreign key SCELL references tbCell(Sector_ID)
)

create table tbC2INew(
	SCELL nvarchar(255) not null,
	NCELL nvarchar(255) not null,
	C2I_mean float,
	std float,
	PrbC2I9 float,
	PrbABS6 float
)

create table tbHandOver(
	CITY nvarchar(255),
	SCELL varchar(50) not null,
	NCELL varchar(50) not null,
	HOATT int,
	HOSUCC int,
	HOSUCCRATE numeric(7,4),
	primary key(SCELL,NCELL),
)

create table tbKPI(
	--	eNodeB内异频切换出成功次数 (无)	eNodeB内异频切换出尝试次数 (无)	eNodeB内同频切换出成功次数 (无)	eNodeB内同频切换出尝试次数 (无)	eNodeB间异频切换出成功次数 (无)	eNodeB间异频切换出尝试次数 (无)	eNodeB间同频切换出成功次数 (无)	eNodeB间同频切换出尝试次数 (无)	eNB内切换成功率 (%)	eNB间切换成功率 (%)	同频切换成功率zsp (%)	异频切换成功率zsp (%)	切换成功率 (%)	小区PDCP层所接收到的上行数据的总吞吐量 (比特)	小区PDCP层所发送的下行数据的总吞吐量 (比特)	RRC重建请求次数 (无)	RRC连接重建比率 (%)	通过重建回源小区的eNodeB间同频切换出执行成功次数 (无)	通过重建回源小区的eNodeB间异频切换出执行成功次数 (无)	通过重建回源小区的eNodeB内同频切换出执行成功次数 (无)	通过重建回源小区的eNodeB内异频切换出执行成功次数 (无)	eNB内切换出成功次数 (次)	eNB内切换出请求次数 (次)
	startTime date,
	turnround int,
	name nvarchar,
	cell_multi nvarchar,
	cell nvarchar,
	suc_time int,
	req_time int,
	RRC_suc_rate float,
	suc_total int,
	try_total int,
	E-RAB_suc_rate float,
	eNodeB_exception int,
	cell_exception int,
	E-RAB_offline float,
	ay float,
	enodeb_release_time int,
	UE-Context_exception_time int,
	UE-Context_suc_time int,
	wifi_offline_rate float,
	s_ float,
	t_ int,
	u_ int,
	v_ int,
	w_ int,
	x_ int,
	y_ int,
	z_ int,
	aa_ int,
	ab_ float,  --NIL????
	ac_ float,
	ad_ float,
	ae_ float, --NIL???
	af_ float,
	ag_ bigint,
	ah_ bigint,
	ai_ int,
	aj_ float,
	ak_ int,
	al_ int,
	am_ int,
	an_ int,
	ao_ int,
	ap_ int
)

create table tbPRB(
	startTime date,
	turnround int,
	name nvarchar,
	cell nvarchar,
	cell_name nvarchar,
	PRB0 int,
	PRB1 int,
	PRB2 int,
	PRB3 int,
	PRB4 int,
	PRB5 int,
	PRB6 int,
	PRB7 int,
	PRB8 int,
	PRB9 int,
	PRB10 int,
	PRB11 int,
	PRB12 int,
	PRB13 int,
	PRB14 int,
	PRB15 int,
	PRB16 int,
	PRB17 int,
	PRB18 int,
	PRB19 int,
	PRB20 int,
	PRB21 int,
	PRB22 int,
	PRB23 int,
	PRB24 int,
	PRB25 int,
	PRB26 int,
	PRB27 int,
	PRB28 int,
	PRB29 int,
	PRB30 int,
	PRB31 int,
	PRB32 int,
	PRB33 int,
	PRB34 int,
	PRB35 int,
	PRB36 int,
	PRB37 int,
	PRB38 int,
	PRB39 int,
	PRB40 int,
	PRB41 int,
	PRB42 int,
	PRB43 int,
	PRB44 int,
	PRB45 int,
	PRB46 int,
	PRB47 int,
	PRB48 int,
	PRB49 int,
	PRB50 int,
	PRB51 int,
	PRB52 int,
	PRB53 int,
	PRB54 int,
	PRB55 int,
	PRB56 int,
	PRB57 int,
	PRB58 int,
	PRB59 int,
	PRB60 int,
	PRB61 int,
	PRB62 int,
	PRB63 int,
	PRB64 int,
	PRB65 int,
	PRB66 int,
	PRB67 int,
	PRB68 int,
	PRB69 int,
	PRB70 int,
	PRB71 int,
	PRB72 int,
	PRB73 int,
	PRB74 int,
	PRB75 int,
	PRB76 int,
	PRB77 int,
	PRB78 int,
	PRB79 int,
	PRB80 int,
	PRB81 int,
	PRB82 int,
	PRB83 int,
	PRB84 int,
	PRB85 int,
	PRB86 int,
	PRB87 int,
	PRB88 int,
	PRB89 int,
	PRB90 int,
	PRB91 int,
	PRB92 int,
	PRB93 int,
	PRB94 int,
	PRB95 int,
	PRB96 int,
	PRB97 int,
	PRB98 int,
	PRB99 int,
)
go


