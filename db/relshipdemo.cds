namespace relationship.db;

entity Header{
    key ID : UUID;
    description : String;
    item_details : Association to many Items on item_details.headerID = $self.ID;
}

entity Items{
    key ID : UUID;
    headerID : UUID;
    product : String;
    quantity : Integer;
}

entity SalesOrderHeader{
    key ID : UUID;
    description : String;
    item_details_comp: Composition of many SalesOrderItems on item_details_comp.header = $self;
}

entity SalesOrderItems{
    key ID : UUID;
    header : Association to SalesOrderHeader;
    product : String;
    quantity : Integer;
}   

