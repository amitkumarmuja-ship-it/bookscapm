const cds= require('@sap/cds');
const { UPDATE } = require('@sap/cds/lib/ql/cds-ql');
const { Books } = cds.entities;

module.exports= srv =>{
    const db= cds.db;

    //Read
    /* srv.on('READ', 'BooksSet', async (req,resp)=>{
       results=[];
       results=await db.run(
        SELECT.from(Books)//.where({ID:req.data.ID})
       );
       return results;
    }); */

    //Create
    srv.on('CREATE', 'BooksSet', async (req,resp)=>{
       results=[];
       results=await db.run(
        INSERT.into(Books).entries(req.data.ID)
        .then((resolve,reject)=>{
        if(resolve){
            return req.data;
        }
        else{
            return req.error(400,'Creation Failed');
        }
        })
        .catch((err)=>{
            return req.error(500,'Internal Server Error: '+err.toString());
        })
       );
       return results;
    });

    //Update
    srv.on('UPDATE', 'BooksSet', async (req,resp)=>{
       results=[];
       results=await db.run(
        UPDATE.entity(Books).set(req.data).where({ID:req.data.ID})
        .then((resolve,reject)=>{
        if(resolve){
            return req.data;
        }
        else{
            return req.error(400,'Update Failed');
        }
        })
        .catch((err)=>{
            return req.error(500,'Internal Server Error: '+err.toString());
        })
       );
       return results;
    });


    //DELETE
    srv.on('DELETE', 'BooksSet', async (req,resp)=>{
       results=[];
       results=await db.run(
        DELETE.from(Books).where({ID:req.data.ID})
        
       );
       return results;
    });
}