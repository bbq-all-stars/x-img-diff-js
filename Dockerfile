FROM trzeci/emscripten:sdk-tag-1.38.48-64bit

RUN emsdk install clang-tag-e1.38.48-64bit
RUN emsdk activate clang-tag-e1.38.48-64bit

# Patch binding header and .js
COPY ./patch_emscripten.diff /src/patch_emscripten.diff
RUN patch -p0 -d /emsdk_portable/emscripten/tag-1.38.48/ < /src/patch_emscripten.diff
