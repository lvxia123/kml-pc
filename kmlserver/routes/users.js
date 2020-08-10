//创建路由器对象
const express=require('express');
//引入数据库连接池
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const router=express.Router();
//往路由器对象添加路由
//1.用户注册路由  post  /reg
router.post('/reg/v1',(req,res)=>{
	//1.1获取post传递的数据
	let phone=req.body.phone;
	let sql='SELECT COUNT(uid) as count FROM kml_user WHERE phone=?';
   //1.3 判断是否有相同的用户名被注册,并插入数据
   pool.query(sql,[phone],(err,results)=>{
	   if(err) throw err;
	   if(results[0].count){
		// 注册失败
		res.send({message:'注册失败',code:0})
	   }else{
		// 注册成功
		let password=req.body.password;
		let sql='INSERT INTO kml_user(phone,upwd) VALUES(?,MD5(?))';
		pool.query(sql,[phone,password],(err,results)=>{
			if(err) throw err;
			if(results.affectedRows==0){
				res.send({message:'注册失败',code:0})
			}else{
				res.send({message:'注册成功',code:1})
			}
		 })
	   }
   });
})

//2.用户登录路由
router.post('/login/v1',(req,res)=>{
  //2.1获取数据
  let phone=req.body.phone;
  let password=req.body.password;
  //2.3执行SQL语句
  pool.query('SELECT * FROM kml_user WHERE phone=? AND upwd=MD5(?)',
	 [phone,password],(err,result)=>{
     if(err) throw err;
	//  console.log(result);
	 if(result.length==1){
		res.send({message:"登录成功",code:1})
	 }else{
		res.send({message:"登录失败",code:0});
	 }
  });
  
});

module.exports=router;