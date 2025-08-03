#!/bin/bash

# Download YOLO v3-tiny model files
echo "Downloading YOLO v3-tiny model files..."

# Ensure we're in the model directory
cd "$(dirname "$0")"
echo "Working in directory: $(pwd)"

# Download weights file (35MB) from the official source
echo "Downloading yolov3-tiny.weights..."
WEIGHTS_DOWNLOADED=false

if curl -L --fail -o yolov3-tiny.weights "https://data.pjreddie.com/files/yolov3-tiny.weights" 2>/dev/null; then
    # Check if file is the correct size (should be exactly 35,434,956 bytes)
    if [ $(stat -f%z yolov3-tiny.weights 2>/dev/null || stat -c%s yolov3-tiny.weights 2>/dev/null) -eq 35434956 ]; then
        echo "✓ Successfully downloaded yolov3-tiny.weights ($(ls -lh yolov3-tiny.weights | awk '{print $5}'))"
        WEIGHTS_DOWNLOADED=true
    else
        echo "❌ Downloaded file has incorrect size"
        rm -f yolov3-tiny.weights
    fi
else
    echo "❌ Download failed"
fi

# If download failed, provide manual instructions
if [ "$WEIGHTS_DOWNLOADED" = false ]; then
    rm -f yolov3-tiny.weights 2>/dev/null
    echo ""
    echo "❌ Automatic download failed. Please download manually:"
    echo ""
    echo "Download command (run from model directory):"
    echo "   cd $(pwd)"
    echo "   curl -L -o yolov3-tiny.weights https://data.pjreddie.com/files/yolov3-tiny.weights"
    echo ""
    echo "Or with wget:"
    echo "   wget https://data.pjreddie.com/files/yolov3-tiny.weights"
    echo ""
    echo "The file should be exactly 35,434,956 bytes (35MB)"
    echo "Verify with: ls -la yolov3-tiny.weights"
    echo ""
fi

# Download config file
echo "Downloading yolov3-tiny.cfg..."
curl -L https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3-tiny.cfg -o yolov3-tiny.cfg

# Download class names file
echo "Downloading coco.names..."
curl -L https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names -o coco.names

echo ""
echo "Download process completed!"
echo "Files in model directory:"
ls -la *.weights *.cfg *.names 2>/dev/null || echo "⚠️  Some files may be missing - see instructions above"

if [ "$WEIGHTS_DOWNLOADED" = false ]; then
    echo ""
    echo "⚠️  IMPORTANT: You need to manually download yolov3-tiny.weights before running the application"
fi
