namespace db.books;
using {managed } from '@sap/cds/common';

entity Books : managed {
    key ID : UUID;
    title : String;
    author : String;
    price: Decimal(10,2);
    publishedDate : DateTime;
    digitalCopy : Boolean;

}