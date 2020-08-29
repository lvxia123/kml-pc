import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import XH from './components/XmlHeader'
import XF from './components/XmlFooter'      
import axios from 'axios'
import qs from 'qs'

// 引入 VueAwesomeswiper
import VueAwesomeswiper from 'vue-awesome-swiper'
// import 'swiper/css/swiper.css' // 未进行全组组件样式加载
Vue.use(VueAwesomeswiper)

Vue.config.productionTip = false
Vue.component("xml-header",XH);
Vue.component("xml-footer",XF);
axios.defaults.baseURL="http://127.0.0.1:3000"
Vue.prototype.axios=axios
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
Vue.prototype.$qs = qs;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
