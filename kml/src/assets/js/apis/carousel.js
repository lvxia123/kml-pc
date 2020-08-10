import config from '../config.js'
function getCarousel(){
    return new Promise(
        function(resolve,reject){
            axios.get(config.baseURL+'/index/v1').then(result=>{
                resolve(result.data)
            })
        }
    )
}

export default {
    getCarousel
}