using { relationship.db as rel} from '../db/relshipdemo';

service relsrv{
    entity HeaderSet as projection on rel.Header;
    entity ItemsSet as projection on rel.Items;

    //Composition
    entity SalesOrderHeaderSet as projection on rel.SalesOrderHeader;
    entity SalesOrderItemsSet as projection on rel.SalesOrderItems;
}


annotate relsrv.SalesOrderHeaderSet with @(
UI:{
    SelectionFields  : [
        ID,description
    ],
    LineItem  : [
        {$Type: 'UI.DataField', Value: ID},
        {$Type: 'UI.DataField', Value: description}
    ],
}
);

annotate relsrv.SalesOrderItemsSet with @(
UI:{
    LineItem  : [
        {$Type: 'UI.DataField', Value: ID},
        {$Type: 'UI.DataField', Value: product},
        {$Type: 'UI.DataField', Value: quantity}
    ],
}
);
