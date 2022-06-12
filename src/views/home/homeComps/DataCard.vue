<template>
    <el-card style="margin-top: 20px; height: 460px;">
        <el-table :data="tableData">
          <el-table-column
            v-for="(val, key) in tableLabel"
            :key="key"
            :prop="key"
            :label="val"
          >
          </el-table-column>
        </el-table>
      </el-card>
</template>

<script>
export default {
    name: 'DataCard',
    props: {
        tableData: {
            type: Array,
            default() {
                return []
            }
        },
        tableLabel: {
            type: Object,
            default() {
                return []
            }
        }
    }
}
</script>

<style lang="less" scoped>
    
</style>