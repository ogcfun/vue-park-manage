<template>
  <div>
    <el-card>
      <div style="height: 700px" ref="scatterEcharts"></div>
    </el-card>
  </div>
</template>

<script>
import axios from "axios";
import "../../components/content/mock/index";
import * as echarts from "echarts";
export default {
  name: "Stats",
  data() {
    return {
      datalist: [],
      dataLao: [],
      dataCrp: [],
      dataJrp: [],
      dataTp: [],
      dataNp: [],
      dataHdp: [],
      itemStyle: {
        opacity: 0.8,
        shadowBlur: 10,
        shadowOffsetX: 0,
        shadowOffsetY: 0,
        shadowColor: "rgba(0,0,0,0.3)",
      },
    };
  },
  created() {
    axios.post("http://localhost:8080/goods/goodAll").then((res) => {
      this.datalist = res.data.listdata;
      this.dataLao = res.data.dataLao;
      this.dataCrp = res.data.dataCrp;
      this.dataJrp = res.data.dataJrp;
      this.dataTp = res.data.dataTp;
      this.dataNp = res.data.dataNp;
      this.dataHdp = res.data.dataHdp;

      const schema = [
        { name: "date", index: 0, text: "日" },
        { name: "gou", index: 1, text: "已购票" },
        { name: "yu", index: 2, text: "预订票" },
        { name: "tui", index: 3, text: "已退票" },
      ];

      const statsOption = {
        legend: {
          top: 10,
          data: [
            "儿童票",
            "成人票",
            "老人票",
            "军人票",
            "团票",
            "年票",
            "活动票",
          ],
          textStyle: {
            fontSize: 16,
          },
        },
        grid: {
          left: "5%",
          right: 150,
          top: "18%",
          bottom: "10%",
        },
        tooltip: {
          backgroundColor: "rgba(255,255,255,0.7)",
          formatter(param) {
            var value = param.value;
            // prettier-ignore
            return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
                 + '' + value[0] + '日：'+ param.seriesName 
                +  ' ' + value[7]+ '元'
                + '</div>'
                + schema[1].text + '：' + value[1] + '<br>'
                + schema[2].text + '：' + value[2] + '<br>'
                + schema[3].text + '：' + value[3] + '<br>'
          },
        },
        xAxis: {
          type: "value",
          name: "日期",
          nameGap: 16,
          nameTextStyle: {
            fontSize: 16,
          },
          max: 31,
          splitLine: {
            show: false,
          },
        },
        yAxis: {
          type: "value",
          name: "购票数量",
          nameLocation: "end",
          nameGap: 20,
          nameTextStyle: {
            fontSize: 16,
          },
          splitLine: {
            show: false,
          },
        },
        visualMap: [
          {
            left: "right",
            top: "10%",
            dimension: 2,
            min: 0,
            max: 250,
            itemWidth: 30,
            itemHeight: 120,
            calculable: true,
            precision: 0.1,
            text: ["预定票"],
            textGap: 30,
            inRange: {
              symbolSize: [10, 70],
            },
            outOfRange: {
              symbolSize: [10, 70],
              color: ["rgba(255,255,255,0.4)"],
            },
            controller: {
              inRange: {
                color: ["#50A80F"],
              },
              outOfRange: {
                color: ["#999"],
              },
            },
          },
          {
            left: "right",
            bottom: "5%",
            dimension: 6,
            min: 0,
            max: 50,
            itemHeight: 120,
            text: ["已退票"],
            textGap: 30,
            inRange: {
              colorLightness: [0.9, 0.5],
            },
            outOfRange: {
              color: ["rgba(255,255,255,0.4)"],
            },
            controller: {
              inRange: {
                color: ["#c23531"],
              },
              outOfRange: {
                color: ["#999"],
              },
            },
          },
        ],
        series: [
          {
            name: "儿童票",
            type: "scatter",
            itemStyle: this.itemStyle,
            data: this.datalist,
          },
          {
            name: "成人票",
            type: "scatter",
            itemStyle: this.itemStyle,
            data: this.dataCrp,
          },
          {
            name: "老人票",
            type: "scatter",
            itemStyle: this.itemStyle,
            data: this.dataLao,
          },
          {
            name: "军人票",
            type: "scatter",
            itemStyle: this.itemStyle,
            data: this.dataJrp,
          },
          {
            name: "团票",
            type: "scatter",
            itemStyle: this.itemStyle,
            data: this.dataTp,
          },
          {
            name: "年票",
            type: "scatter",
            itemStyle: this.itemStyle,
            data: this.dataNp,
          },
          {
            name: "活动票",
            type: "scatter",
            itemStyle: this.itemStyle,
            data: this.dataHdp,
          },
        ],
      };

      const S = echarts.init(this.$refs.scatterEcharts);
      S.setOption(statsOption);
    });
  },
};
</script>

<style lang="less" scoped>
</style>