<template slot-scope="scope">
  <el-form :model="classTicketForm" :rules="rules" ref="classTicketForm">
    <el-form-item label="门票类型" prop="namevalue">
      <el-input v-model="classTicketForm.value" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="原始价格" prop="price">
      <el-input v-model="classTicketForm.price" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="优惠价格">
      <el-input
        v-model="classTicketForm.h_price"
        auto-complete="off"
      ></el-input>
    </el-form-item>
    <el-form-item label="优惠时间" prop="addr">
      <el-date-picker
        style="width: 100%"
        v-model="classTicketForm.formTime"
        type="daterange"
        range-separator="至"
        start-placeholder="优惠起始日期"
        end-placeholder="优惠结束日期"
        value-format="yyyy-MM-dd"
      >
      </el-date-picker>
    </el-form-item>
  </el-form>
</template>
<script>
export default {
  name: "CommonClassTicket",
  props: {
    classTicketForm: Object,
    default() {
      return {};
    },
  },
  data() {
    return {
      rules: {
        namevalue: [
          {
            required: true,
            message: "门票类型不能为空",
            trigger: "blur",
          },
        ],
        price: [
            {
            required: true,
            message: "门票价格不能为空",
            trigger: "blur",
          },
        ]
      },
    };
  },
};
</script>
<style lang="less" scoped>
</style>