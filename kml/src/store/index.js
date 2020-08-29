import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'


Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //组件一开始加载时，执行这个文件时，先从本地缓存把购物车数据拉下来，保存进全局
    cart:JSON.parse(localStorage.getItem('cart')||'[]'),
    isLogined:localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : false,
    uid: localStorage.getItem('uid') || 0,
    phone: localStorage.getItem('phone') || '',
  },
  getters:{
     //用来获取右上角加入购物车的数量，总数量c
    getAllCount(state){
     var count =0;
     state.cart.forEach(item=>{
       count+=item.count;
     })
     return count;
     },
    getCart (state){
      return state.cart
    }
  },
  mutations: { //专门负责修改state中的状态
    logined_mutations:(state,payload)=>{
      //将用户登录状态改为真
      state.isLogined = true;
      state.uid = payload.uid;
      state.phone = payload.phone;
    },
    logout_mutations:(state)=>{
      //将用户登录状态改为假
      state.isLogined = false;
      //清理掉webStroage
      localStorage.clear();
      state.cart=[];
    },
    addToCart(state,goods){ //点击加入购物车，把商品保存到store的car上
      let flag=false;//假设购物车中没有找到
      //如果购物车之前有商品，只需要更新数量，否则添加新的商品
      state.cart.forEach(item => {
        if(item.pid==goods.pid){
          item.count += parseInt(goods.count);
          flag=true;
          return true;
        }
      });
      //如果最终循环完毕，得到flag还是false，则把商品数据直接添加到cart中
      if(!flag){
        state.cart.push(goods);
      }
      // console.log(state.cart)
      //把cart 存储到本地的localstorage里面
      localStorage.setItem('cart',JSON.stringify(state.cart))
    },
    //增加商品
    addCart(state,goods){
      state.cart.forEach(item => {
        if(item.pid==goods.pid){
          item.count ++
        }
      });
       //把cart 存储到本地的localstorage里面
       localStorage.setItem('cart',JSON.stringify(state.cart))
    },
    // 减少商品
    minCart(state,goods){
      state.cart.forEach((item,index) => {
        if(item.pid==goods.pid){
          item.count --
        }
        if(goods.count <= 0){
          state.cart.splice(index,1)
        }
      });
      //把cart 存储到本地的localstorage里面
      localStorage.setItem('cart',JSON.stringify(state.cart))
    },
    // 删除商品
    delCart(state,goods){
      state.cart.forEach((item,index) => {
        if(item.pid==goods.pid){
          state.cart.splice(index,1)
        }
      })
      //把cart 存储到本地的localstorage里面
      localStorage.setItem('cart',JSON.stringify(state.cart))
    },
    // 用户结算后清空前端购物车缓存
    clearCart(state){
      state.cart = []
      //把cart 存储到本地的localstorage里面
      localStorage.setItem('cart',JSON.stringify(state.cart));
      location.reload();
    }
  },
  actions: {
  },
  modules: {
  }
})
