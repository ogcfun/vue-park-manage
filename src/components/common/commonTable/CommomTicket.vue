<template>
    <el-form :model="ticketForm"  ref="ticketForm">
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
        <el-select v-model="ticketForm.ticket_type" style="width:100%" @change="$forceUpdate()">
            <el-option v-for="item in setType" :key="item.label" :label="item.label" :value="item.value"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="addr">
        <el-select v-model="ticketForm.ticket_state" style="width:100%" @change="$forceUpdate()">
            <el-option v-for="item in setState" :key="item.label" :label="item.label" :value="item.value"></el-option>
        </el-select>
      </el-form-item>
    </el-form>
</template>
<script>
export default {
  name: "CommonTicket",
  props: {
    ticketForm: {
        type: Object,
        default() {
            return {}
        }
    }
  },
  data() {
    return {
        setType: [
            {
                label: '儿童票',
                value: '儿童票',
            },
            {
                label: '成人票',
                value: '成人票',
            },
            {
                label: '老人票',
                value: '老人票',
            },
            {
                label: '军人票',
                value: '军人票',
            },
            {
                label: '团票',
                value: '团票',
            },
            {
                label: '年票',
                value: '年票',
            },
            {
                label: '活动票',
                value: '活动票',
            },
        ],
        setState: [
            {
                label: '已购票',
                value: '已购票',
            },
            {
                label: '已退票',
                value: '已退票',
            },
            {
                label: '预订票',
                value: '预订票',
            },
        ]
    }
  },
};
</script>
<style lang="less" scoped>
</style>