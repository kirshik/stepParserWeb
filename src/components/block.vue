<template>
  <div class="left-panel">
    <li v-for="(item, key) in data" :key="key">
      <span
        @click="emit('handleClick', item, String(key))"
        :class="{ accent: accent == String(key) }"
        >{{ key }}</span
      >
      <ul>
        <li
          v-if="item.childAmount > 0"
          v-for="(child, childKey) in item.children"
          :key="childKey"
        >
          <slot :child="child"></slot>
        </li>
      </ul>
    </li>
  </div>
</template>

<script setup lang="ts">
import { toRefs } from "vue";
interface StpParserBlockProps {
  data: any;
  accent: string;
}
const props = defineProps<StpParserBlockProps>();
const emit = defineEmits<{
  (e: "handleClick", item: unknown, key: string): void;
}>();
const { data, accent } = toRefs(props);
</script>

<style scoped>
.left-panel {
  width: fit-content;
  min-width: 20vw;
  text-align: start;
  height: 100%;
}
li {
  white-space: nowrap;
  word-break: keep-all;
  list-style: none;
}
.accent {
  font-weight: bold;
}
</style>
