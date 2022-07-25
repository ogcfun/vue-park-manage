<template>
  <div class="record-list">
    <record-list-item
      class="record"
      v-for="(item, index) in record"
      :key="index"
      :record-list="item"
    />
  </div>
</template>

<script>
import RecordListItem from "./RecordListItem.vue";
export default {
  components: { RecordListItem },
  name: "RecordList",
  props: {
    record: {
      type: Array,
      default() {
        return [];
      },
    },
  },
};
</script>

<style scoped>
.record {
  width: 100%;
  padding: 10px;
  position: relative;
}
.record:nth-child(odd) {
  background-color: #eee;
}
</style>