<template>
  <el-form :model="ticketForm" :rules="rules" ref="ticketForm">
    <el-form-item label="姓名" prop="user_account">
      <el-input v-model="ticketForm.ticket_name" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="年龄" prop="user_name">
      <el-input v-model="ticketForm.ticket_year" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="电话" prop="email">
      <el-input v-model="ticketForm.ticket_ip" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="类型" prop="addr">
      <el-select
        v-model="ticketForm.ticket_type"
        style="width: 100%"
        @change="$forceUpdate()"
      >
        <el-option
          v-for="item in setType"
          :key="item.label"
          :label="item.label"
          :value="item.value"
        ></el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="状态" prop="addr">
      <el-select
        v-model="ticketForm.ticket_state"
        style="width: 100%"
        @change="$forceUpdate()"
      >
        <el-option
          v-for="item in setState"
          :key="item.label"
          :label="item.label"
          :value="item.value"
        ></el-option>
      </el-select>
    </el-form-item>
  </el-form>
</template>
<script>
import { getClassTicketData } from 'network/class';
export default {
  name: "CommonTicket",
  props: {
    ticketForm: {
      type: Object,
      default() {
        return {};
      },
    },
  },
  data() {
    return {
      setType: [
        {
          label:'',
          value:'',
        },
      ],
      setState: [
        {
          label: "已购票",
          value: "已购票",
        },
        {
          label: "已退票",
          value: "已退票",
        },
        {
          label: "预订票",
          value: "预订票",
        },
      ],
      rules: {
        user_account: [
            { required: true, message: "请输入姓名" },
        ],
        user_name:[
            { required: true, message: "请输入年龄" },
        ],
        email:[
            { required: true, message: "请输入电话号码" },
        ],
      }
    };
  },
  mounted() {
    getClassTicketData().then(res => {
      console.log(res);
      for(let i=0;i<res.tb_class_ticket.length;i++){
         this.setType.push({label:res.tb_class_ticket[i].value,value:res.tb_class_ticket[i].value})
      }
    })
  },
};
</script>
<style lang="less" scoped>
</style>