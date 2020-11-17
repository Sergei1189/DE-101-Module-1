
CREATE TABLE "customer"
(
 "customer_id"   varchar(50) NOT NULL,
 "customer_name" varchar(150) NOT NULL,
 CONSTRAINT "PK_customer" PRIMARY KEY ( "customer_id" )
);

CREATE TABLE "sale"
(
 "order_id"    varchar(100) NOT NULL,
 "ship_date"   date NOT NULL,
 "ship_mode"   varchar(100) NOT NULL,
 "sales"       decimal(18,4) NOT NULL,
 "quantity"    int NOT NULL,
 "discount"    decimal(2,2) NOT NULL,
 "customer_id" varchar(50) NOT NULL,
 "profit"      decimal(18,6) NOT NULL,
 CONSTRAINT "PK_sales" PRIMARY KEY ( "order_id" ),
 CONSTRAINT "FK_27" FOREIGN KEY ( "customer_id" ) REFERENCES "customer" ( "customer_id" )
);

CREATE INDEX "fkIdx_27" ON "sale"
(
 "customer_id"
);
CREATE TABLE "product"
(
 "product_id"   varchar(50) NOT NULL,
 "product_name" varchar(150) NOT NULL,
 "category"     varchar(50) NOT NULL,
 "sub-category" varchar(50) NOT NULL,
 "order_id"     varchar(100) NOT NULL,
 CONSTRAINT "PK_product" PRIMARY KEY ( "product_id" ),
 CONSTRAINT "FK_40" FOREIGN KEY ( "order_id" ) REFERENCES "sale" ( "order_id" )
);

CREATE INDEX "fkIdx_40" ON "product"
(
 "order_id"
);
CREATE TABLE "Geography"
(
 "country"     varchar(50) NOT NULL,
 "state"       varchar(50) NOT NULL,
 "city"        varchar(50) NOT NULL,
 "postal_code" int NOT NULL,
 "segment"     varchar(50) NOT NULL,
 "order_id"    varchar(100) NOT NULL,
 CONSTRAINT "PK_geography" PRIMARY KEY ( "country" ),
 CONSTRAINT "FK_30" FOREIGN KEY ( "order_id" ) REFERENCES "sale" ( "order_id" )
);

CREATE INDEX "fkIdx_30" ON "Geography"
(
 "order_id"
);
CREATE TABLE "manager"
(
 "region"  varchar(50) NOT NULL,
 "person"  varchar(50) NOT NULL,
 "country" varchar(50) NOT NULL,
 CONSTRAINT "PK_maneger" PRIMARY KEY ( "region" ),
 CONSTRAINT "FK_47" FOREIGN KEY ( "country" ) REFERENCES "Geography" ( "country" )
);

CREATE INDEX "fkIdx_47" ON "manager"
(
 "country"
);
