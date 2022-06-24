import Mock from 'mockjs'

let listdata = []
let dataLao = []
let dataCrp = []
let dataJrp = []
let dataTp = []
let dataNp = []
let dataHdp = []

for (let i = 0; i < 31; i++) {
    listdata.push(
        Mock.mock([
            i + 1,
            '@natural(60,200)',
            '@natural(20,100)',
            '@natural(10,40)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(5000,8000)',
        ])
    )
}

for (let i = 0; i < 31; i++) {
    dataLao.push(
        Mock.mock([
            i + 1,
            '@natural(80,300)',
            '@natural(30,80)',
            '@natural(10,30)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(7000,12000)',
        ])
    )
}

for (let i = 0; i < 31; i++) {
    dataCrp.push(
        Mock.mock([
            i + 1,
            '@natural(140,280)',
            '@natural(20,70)',
            '@natural(10,50)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(6000,9000)',
        ])
    )
}
for (let i = 0; i < 31; i++) {
    dataJrp.push(
        Mock.mock([
            i + 1,
            '@natural(40,100)',
            '@natural(20,60)',
            '@natural(10,40)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(4000,7000)',
        ])
    )
}
for (let i = 0; i < 31; i++) {
    dataTp.push(
        Mock.mock([
            i + 1,
            '@natural(30,90)',
            '@natural(5,30)',
            '@natural(1,10)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(6000,10000)',
        ])
    )
}
for (let i = 0; i < 31; i++) {
    dataNp.push(
        Mock.mock([
            i + 1,
            '@natural(10,90)',
            '@natural(30,50)',
            '@natural(4,15)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(7000,10900)',
        ])
    )
}
for (let i = 0; i < 31; i++) {
    dataHdp.push(
        Mock.mock([
            i + 1,
            '@natural(200,500)',
            '@natural(90,150)',
            '@natural(20,80)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(10,100)',
            '@natural(9000,18000)',
        ])
    )
}

Mock.mock(/goods\/goodAll/, 'post', () => { //三个参数。第一个：路径，第二个：请求方式post/get，第三个：回调，返回值
    return { listdata: listdata, dataLao: dataLao, dataCrp: dataCrp, dataJrp: dataJrp, dataTp: dataTp, dataNp: dataNp, dataHdp: dataHdp }
})