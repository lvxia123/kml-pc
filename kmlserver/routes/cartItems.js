var express=require("express");
var router=express.Router();
var pool=require("../pool");
var query=require("./query");

router.get("/v1/add",(req,res)=>{
  let lid=req.query.pid;
  let count=req.query.num;
  console.log(lid,count)
  let sql="select * from kml_shoppingcart_item where  product_id=?";
  query(sql,[lid])
  .then(result=>{
    if(result.length==0){
      let sql="insert into kml_shoppingcart_item values(null,null,?,?,0)";
      pool.query(sql,[lid,count],(err,result)=>{
        res.send();
      })
    }else{
      let sql="update kml_shoppingcart_item set count=count+? where product_id=?";
      pool.query(sql,[count,lid],(err,result)=>{
        res.send();
      })
    }
  })
})

router.get("/v1/list",(req,res)=>{
  let sql="select a.product_id,a.count,b.title,b.spec,b.price,c.img from kml_shoppingcart_item as a inner join kml_cake_detail as b on a.product_id=b.cid inner join kml_shoppingcart_pic as c on a.product_id=c.cake_id";
  query(sql).then(result=>{
   console.log(result);
   if(result.length>0){
    res.send({message:"查询成功",code:1,result:result});
   }
  })
})

router.get("/v1/update",(req,res)=>{
  // var {iid,count}=req.query;
  let pid=req.query.pid;
  let count=req.query.count;
  if(count>0){
    var sql="update kml_shoppingcart_item set count=? where product_id=?";
    pool.query(sql,[count,pid],(err,result)=>{
      if(err) throw err;
      res.send();
    })
  }else{
    var sql="delete from kml_shoppingcart_item where product_id=?";
    pool.query(sql,[pid],(err,result)=>{
      if(err) throw err;
      res.send();
    })
  }
});

router.get("/v1/delete",(req,res)=>{
  let pid=req.query.pid;
  console.log(pid)
  var sql="delete from kml_shoppingcart_item where product_id=?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) throw err;
    res.send();
  })
})
//http://localhost:3000/cartItems/update?iid=X&count=X

module.exports=router;