import axios from 'axios'
import {baseURL} from '../config.js'
function getIndex(){
    return new Promise(
        function(resolve,reject){
            axios.get(baseURL+'/index/v1').then(result=>{
                resolve(result.data)
            })
        }
    )
}

export {
    getIndex
}