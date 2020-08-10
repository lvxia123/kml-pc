const express=require("express");
var router=express.Router();
var pool=require("../pool");
router.get("/v1/carousel",(req,res)=>{
  var sql="SELECT * FROM kml_index_carousel";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})
router.get("/v1",(req,res)=>{
  var sql="SELECT * FROM kml_index_pic";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    res.send(result);
  })
})
module.exports=router;
