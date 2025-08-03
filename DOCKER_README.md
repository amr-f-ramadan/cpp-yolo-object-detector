# YOLO Object Detector - Docker Usage

## Docker Setup

This project includes Docker configuration files to easily build and run the YOLO object detector in a containerized environment with all necessary dependencies.

### Files Created:
- `Dockerfile` - Main container configuration
- `docker-compose.yml` - Service orchestration
- `.dockerignore` - Files to exclude from Docker build context

## Quick Start

### Option 1: Using Docker Compose (Recommended)

1. **Build and run with default image:**
   ```bash
   docker-compose up yolo-object-detector
   ```

2. **Interactive mode for custom commands:**
   ```bash
   docker-compose up yolo-detector-interactive
   # Inside container:
   ./objectdetector --input=/app/data/coffee.jpg --conf=0.6
   ```

3. **Batch process all images:**
   ```bash
   docker-compose up yolo-detector-batch
   ```

### Option 2: Using Docker directly

1. **Build the image:**
   ```bash
   docker build -t yolo-detector .
   ```

2. **Run with default help:**
   ```bash
   docker run --rm yolo-detector
   ```

3. **Run with specific image:**
   ```bash
   docker run --rm \
     -v $(pwd)/data:/app/data:ro \
     -v $(pwd)/output:/app/output:rw \
     yolo-detector \
     ./objectdetector --input=/app/data/people.jpg
   ```

## Docker Configuration Details

### Base Image: Ubuntu 20.04
The container includes:
- **Build tools**: gcc, g++, cmake, make
- **OpenCV 4.x**: Complete installation with development headers
- **Additional libraries**: GTK, video codecs, image processing libraries
- **Network tools**: wget, curl for downloading model files

### Automatic Setup:
- Downloads YOLO model files automatically
- Compiles the C++ project
- Sets up proper working directories

### Volume Mounts:
- `/app/data` - Input images (read-only)
- `/app/output` - Processed output images (read-write)
- `/app/input` - Optional additional input directory

### Environment Variables:
You can customize behavior with environment variables:
```bash
# Custom input directory from host
export HOST_INPUT_DIR=/path/to/your/images
docker-compose up yolo-object-detector

# For X11 display support (Linux/macOS with XQuartz)
export DISPLAY=:0
```

## Usage Examples

### Process a single image:
```bash
docker run --rm \
  -v $(pwd)/data:/app/data:ro \
  -v $(pwd)/output:/app/output:rw \
  yolo-detector \
  ./objectdetector --input=/app/data/your-image.jpg --conf=0.5 --nms=0.4
```

### Process with custom confidence threshold:
```bash
docker-compose run --rm yolo-object-detector \
  ./objectdetector --input=/app/data/people.jpg --conf=0.7 --nms=0.3
```

### Interactive development:
```bash
docker-compose run --rm yolo-detector-interactive
# Inside container, you can:
# - Modify parameters
# - Test different images
# - Debug issues
```

## Output

Processed images with bounding boxes will be saved to the `output/` directory as `out.jpg`.

## Troubleshooting

1. **Permission issues with output directory:**
   ```bash
   chmod 777 output/
   ```

2. **Display issues (GUI):**
   - The container runs headless by default
   - Processed images are saved to output directory
   - For X11 display, ensure proper DISPLAY variable and xhost permissions

3. **Custom images:**
   - Place your images in the `data/` directory
   - Or mount a custom directory using `-v` flag
   - Supported formats: jpg, png, jpeg

## Dependencies Installed

The Docker container automatically installs:
- OpenCV 4.x with all modules
- C++17 compiler (gcc/g++)
- CMake 3.16+
- All required image processing libraries
- YOLO model files (yolov3-tiny.weights, yolov3-tiny.cfg, coco.names)
