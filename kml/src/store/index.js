import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogined:localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : false
  },
  mutations: { //专门负责修改state中的状态
    logined_mutations:(state)=>{
      //将用户登录状态改为真
      state.isLogined = true;
    },
    logout_mutations:(state)=>{
      //将用户登录状态改为假
      state.isLogined = false;
      //清理掉webStroage
      localStorage.clear();
    }
  },
  actions: {
  },
  modules: {
  }
})
