<template>
    <el-card style="height: 263px">
        <div style="height: 240px" ref="videoEcharts"></div>
    </el-card>
</template>
<script>
import {getHomeData} from 'network/home';
import * as echarts from "echarts";

export default {
    name: 'VideoData',
    mounted() {
    getHomeData().then((res) => {
      this.videodata = res.data.videodata;

      const videoOption = {
        tooltip: {
          trigger: "item",
        },
        title: {
          left: "center",
          top: "center",
        },
        series: [
          {
            type: "pie",
            data: this.videodata,
            radius: ['40%', '70%']
          },
        ],
      };
      const V = echarts.init(this.$refs.videoEcharts);
      V.setOption(videoOption);
    });
  },
}
</script>
<style lang="less" scoped>
    
</style>