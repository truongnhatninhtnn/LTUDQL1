create database LIBRARY
use LIBRARY
--tạo bảng thẻ--
create table CARDREADER(
IDcardreader nchar(10),
IDreader nchar(10),
Begindate datetime,
Enddate datetime,
IDbook nchar(10),
typecard nchar(10),
IDuser nchar(10),
DebtPrice float,
primary key (IDcardreader)
)
--tạo bảng đọc giả--
create table READER(
IDreader nchar(10),
Namereader nvarchar(100),
Addresss nvarchar(100),
Birthdate datetime,
Email nvarchar(50),
Gender nchar(10),
Note nvarchar(100),
primary key(IDreader)
)
--tảo bảng sách--
create table BOOK(
IDbook nchar(10),
IDauthor nchar(10),
IDCategory nchar(10),
IDborrow nchar(10),
Beginyear datetime,
Price float,
Endyear datetime,
Namebook nvarchar(100),
IDpublisher nchar(10),
IDuser nchar(10),
primary key(IDbook)
)
--tạo bảng cho mượn--
create table BORROW(
IDborrow nchar(10),
IDbook nchar(10),
IDcardreader nchar(10),
Borrowdate datetime,
Repaydate datetime,
primary key(IDborrow)
)
--tạo bảng nhân viên--
create table USERS(
IDuser nchar(10),
Nameuser nvarchar(100),
Addresss nvarchar(100),
Phonenumber nchar(20),
Birthdate datetime,
Gender nchar(10),
primary key (IDuser)
)
--tạo bảng tác giả--
create table AUTHOR(
IDauthor nchar(10),
Nameauthor nvarchar(100),
Addresss nvarchar(100),
Birthdate datetime,
Gender nchar(10),
primary key(IDauthor)
)
--tạo bảng thể loại--
create table CATEGORY(
IDCategory nchar(10),
Namecategory nchar(100),
IDbook nchar(10),
IDauthor nchar(10),
IDpublisher nchar(10),
Specialized nvarchar(100),
Number int,
Note nvarchar(100),
primary key(IDCategory)
)
--tạo bảng nhà xuất bản--
create table PUBLISHER(
IDpublisher nchar(10),
Namepublishe nvarchar(100),
Addresss nvarchar(100),
Phonenumber nchar(20),
primary key(IDpublisher)
)
create table BILL(
IDbill nchar(10),
IDcardreader nchar(10),
billdate datetime,
moneynumber float,
primary key (IDbill)
)
alter table BORROW add constraint fk_BORROW_CARDREADER foreign key(IDcardreader) references CARDREADER(IDcardreader)
alter table CARDREADER add constraint fk_CARDREADER_READER foreign key (IDreader) references READER(IDreader)
alter table BORROW add constraint fk_BORROW_BOOK foreign key (IDbook) references BOOK(IDbook)
alter table BOOK add constraint fk_BOOK_CATEGORY foreign key (IDCategory) references CATEGORY(IDCategory)
alter table CARDREADER add constraint fk_CARDREADER_USERS foreign key(IDuser) references USERS(IDuser)
alter table BOOK add constraint fk_BOOK_USERS foreign key(IDuser) references USERS(IDuser)
alter table BOOK add constraint fk_BOOK_PUBLISHER foreign key(IDpublisher) references PUBLISHER(IDpublisher)
alter table BOOK add constraint fk_BOOK_AUTHOR foreign key(IDauthor) references AUTHOR(IDauthor)
alter table BILL add constraint fk_BILL_CARDREADER foreign key(IDcardreader) references CARDREADER(IDcardreader)
