docker run --rm --runtime nvidia --gpus='"device=0"' \
--mount type=bind,source=/path/to/model,target=/llm \
-p 18312:8000 \
--ipc=host \
vllm/vllm-openai:v0.12.0  \
--model /llm/xLAM-2-3b-fc-r \
--served-model-name xLAM-2-3b-fc-r \
--gpu-memory-utilization 0.95 \
--max-model-len 16384 \
--tensor-parallel-size 1 \
--kv-cache-dtype auto \
--enable-prefix-caching  \
--enable-chunked-prefill \
--enable-auto-tool-choice \
--tool-call-parser xlam \