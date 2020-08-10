import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Index.vue'
// import goodsc from '../src/componets/goods/GoodsClassify.vue'


Vue.use(VueRouter)

  const routes = [
  { path: '/', component: Home },
  {
    path: '/login',
    name: 'Login',
    // route level code-splitting
    // this generates a separate chunk (login.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "login" */ '../views/Login.vue'),
    props:true
  },
  {
    path: '/reg',
    name: 'Reg',
    // route level code-splitting
    // this generates a separate chunk (reg.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "reg" */ '../views/Reg.vue'),
    props:true
  },
  {
    path: '/goods/:lid',
    name: 'Goods',
    // route level code-splitting
    // this generates a separate chunk (goods.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "goods" */ '../views/Goods.vue'),
    props:true
  },
  {
    path: '/details/:lid',
    name: 'Details',
    // route level code-splitting
    // this generates a separate chunk (details.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "details" */ '../views/Details.vue'),
    props:true
  },
  {
    path: '/car',
    name: 'Car',
    // route level code-splitting
    // this generates a separate chunk (car.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "car" */ '../views/Car.vue'),
    props:true
  },
 
]

const router = new VueRouter({
  routes
})

export default router
