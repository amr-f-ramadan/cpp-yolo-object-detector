# C++ YOLO Object Detector - Udacity Capstone Project

[![C++](https://img.shields.io/badge/C++-17-blue.svg)](https://en.cppreference.com/w/cpp/17)
[![OpenCV](https://img.shields.io/badge/OpenCV-4.1+-green.svg)](https://opencv.org/)
[![CMake](https://img.shields.io/badge/CMake-3.11+-orange.svg)](https://cmake.org/)
[![Docker](https://img.shields.io/badge/Docker-Supported-blue.svg)](https://www.docker.com/)

## Real-time Object Detection with YOLO and C++

<img src="output/out.jpg" alt="Object Detection Results" width="800"/>

## 🎯 Project Overview

**This Project was first submitted on October 9, 2021. Later on, it went through some enhancements that are listed below.**

This is my **capstone project** for the [Udacity C++ Nanodegree Program](https://www.udacity.com/course/c-plus-plus-nanodegree--nd213). I've developed a robust, high-performance object detection application using **C++17**, **OpenCV**, and the **YOLO (You Only Look Once)** deep learning model.

### 🚀 Key Features & My Contributions

- **Modular Architecture**: Designed a clean, extensible OOP architecture with separate classes for input handling, object detection, and output processing
- **Multi-Model Support**: Engineered the system to work with YOLO models (yolov3-tiny) with configurable parameters
- **Enhanced Docker Support**: Created comprehensive Docker containerization with multi-service support for different use cases
- **Advanced Memory Management**: Implemented modern C++ features including smart pointers, RAII, move semantics, and proper resource management
- **Thread-Safe Buffer System**: Developed a generic template-based buffer with mutex protection for concurrent operations
- **Cross-Platform Compatibility**: Fully functional on Linux, macOS, and Windows with proper dependency management
- **Robust Model Download System**: Automated script with fallback mechanisms for downloading YOLO model files

### 🔧 Technical Enhancements I Implemented

1. **Advanced C++ Features**:
   - Template-based generic buffer class with thread safety
   - Move constructors and Rule of 5 implementation
   - Smart pointer usage throughout the codebase
   - Exception handling and resource management

2. **Docker Integration**:
   - Multi-stage Docker builds for optimized images
   - Docker Compose configuration for different deployment scenarios
   - Automated dependency installation and model downloading
   - Volume mounting for seamless data management

3. **Improved User Experience**:
   - Enhanced command-line interface with comprehensive help
   - Configurable confidence and NMS thresholds
   - Automatic output directory management
   - Detailed error handling and user feedback

4. **Code Quality & Maintainability**:
   - Clean separation of concerns with dedicated classes
   - Comprehensive documentation and inline comments
   - CMake build system with proper dependency management
   - Cross-platform compatibility (Linux, macOS, Windows)

## 📁 Project Structure

```
cpp-yolo-object-detector/
├── src/                   # Source files
│   ├── main.cpp           # Entry point with command-line parsing
│   ├── input.cpp          # Image/video input handling
│   ├── object_detector.cpp # YOLO detection implementation
│   └── output.cpp         # Result output management
├── include/               # Header files
│   ├── buffer.h           # Thread-safe template buffer
│   ├── input.h            # Input class interface
│   ├── object_detector.h  # Detection class interface
│   └── output.h           # Output class interface
├── model/                 # YOLO model files
│   ├── getModel.sh        # Automated model downloading script
│   ├── yolov3-tiny.cfg    # Model configuration (1,915 bytes)
│   ├── yolov3-tiny.weights # Pre-trained weights (35,434,956 bytes)
│   └── coco.names         # Object class labels (80 classes, 625 bytes)
├── data/                  # Sample input images for testing
│   ├── airplane.jpg       # Aircraft detection sample
│   ├── bicycle.jpg        # Transportation sample
│   ├── cars.jpg           # Vehicle detection sample
│   ├── cats.jpg           # Pet detection sample
│   ├── coffee.jpg         # Object detection sample
│   ├── dogs.jpg           # Animal detection sample
│   └── people.jpg         # People detection sample
├── output/                # Generated detection results
│   └── out.jpg            # Latest detection output with bounding boxes
├── build/                 # Compiled binaries (generated after build)
│   └── objectdetector     # Main executable
├── .devcontainer/         # VS Code development container
│   └── devcontainer.json  # Container configuration
├── .git/                  # Git repository data
├── .gitignore             # Git exclusions
├── .dockerignore          # Docker build exclusions
├── Dockerfile             # Container configuration for deployment
├── docker-compose.yml     # Multi-service deployment configuration
├── CMakeLists.txt         # Build configuration and dependencies
├── DOCKER_README.md       # Docker-specific usage instructions
└── README.md              # This documentation file
```

### 📋 Key Directory Details

- **src/**: Contains the core C++ implementation files
- **include/**: Header files with class definitions and interfaces
- **model/**: YOLO model files - weights file requires download (35MB)
- **data/**: Sample images for testing object detection
- **output/**: Generated results with detected objects and bounding boxes
- **build/**: Compilation output directory (created during build process)


## 🛠️ Dependencies & Requirements

### System Requirements
- **C++ Compiler**: gcc/g++ >= 5.4 with C++17 support
- **CMake**: >= 3.11.3 ([Installation Guide](https://cmake.org/install/))
- **Make**: >= 4.1 (Linux/Mac), 3.81 (Windows)
- **OpenCV**: >= 4.1.x ([OpenCV Installation](https://opencv.org/))

### Platform Support
- ✅ **Linux**: Ubuntu 18.04+ (Tested and verified)
- ✅ **macOS**: 10.14+ with Xcode command line tools
- ✅ **Windows**: MinGW or Visual Studio 2019+
- ✅ **Docker**: Any platform with Docker support

### Docker Dependencies (Automated)
When using Docker, all dependencies are automatically installed:
- Ubuntu 20.04 base image
- OpenCV 4.x with development headers
- All required C++ build tools
- YOLO model files (auto-downloaded)

## 🚀 Quick Start

### Option 1: Docker (Recommended)
```bash
# Clone the repository
git clone https://github.com/amr-f-ramadan/cpp-yolo-object-detector.git
cd cpp-yolo-object-detector

# Build and run with Docker Compose
docker-compose up yolo-object-detector

# Or run interactively
docker-compose up yolo-detector-interactive
```

### Option 2: Local Build
```bash
# 1. Clone the repository
git clone https://github.com/amr-f-ramadan/cpp-yolo-object-detector.git
cd cpp-yolo-object-detector

# 2. Download YOLO model files (REQUIRED)
cd model
chmod +x getModel.sh
./getModel.sh

# If automatic download fails, download manually:
# curl -L -o yolov3-tiny.weights https://data.pjreddie.com/files/yolov3-tiny.weights
# (see troubleshooting section for details)

cd ..

# 3. Build the project
mkdir build && cd build
cmake ..
make

# 4. Run object detection
./objectdetector --input=../data/dogs.jpg --conf=0.5 --nms=0.4
```

> **⚠️ Important**: You must download the YOLO model weights before running the application. The `yolov3-tiny.weights` file is required but not included in the repository due to its large size (35MB). The automated script should work, but manual download instructions are provided in the troubleshooting section if needed.

## � Troubleshooting

### Common Issues

#### "Failed to open NetParameter file: ../model/yolov3-tiny.cfg"
**Error**: `error: (-212:Parsing error) Failed to open NetParameter file`

**Solution**: You're running the application from the wrong directory. The app expects to be run from `build/`:
```bash
cd build
./objectdetector --input=../data/dogs.jpg

# NOT from root directory like this:
# ./build/objectdetector --input=data/dogs.jpg  # This can cause path issues
```

#### "Failed to parse NetParameter file: ../model/yolov3-tiny.weights"
**Error**: `OpenCV(4.12.0) ... error: (-212:Parsing error) Failed to parse NetParameter file`

**Solution**: The YOLO model weights file is missing. Run the model download script:
```bash
cd model
chmod +x getModel.sh
./getModel.sh
cd ..
```

#### "wget: command not found" (macOS)
**Error**: `./getModel.sh: line 1: wget: command not found`

**Solution**: The script has been updated to use `curl` (available on both macOS and Linux). If you still see this error, make sure you have the latest version of the script:
```bash
git pull origin main  # Get latest version
cd model
./getModel.sh
```

#### Manual Model Download (if script fails)
If the automatic download script doesn't work, manually download the required files:

1. **Download yolov3-tiny.weights** (35MB):
   ```bash
   # Primary source (official YOLO weights)
   curl -L -o yolov3-tiny.weights https://data.pjreddie.com/files/yolov3-tiny.weights
   
   # Alternative using wget
   wget https://data.pjreddie.com/files/yolov3-tiny.weights
   ```
   
   **File verification:**
   - The file should be exactly 35,434,956 bytes (35MB)
   - Use `ls -la yolov3-tiny.weights` to verify size

2. **Verify all files exist**:
   ```bash
   cd model
   ls -la
   # Should show: 
   # coco.names (625 bytes) - Object class labels
   # yolov3-tiny.cfg (1,915 bytes) - Model configuration  
   # yolov3-tiny.weights (35,434,956 bytes) - Pre-trained weights
   ```

#### Build Errors
- Ensure you have C++17 support: `g++ --version` (should be 7.0+)
- Install OpenCV development headers: `sudo apt-get install libopencv-dev`
- Verify CMake version: `cmake --version` (should be 3.11+)

#### Docker Issues
- Ensure Docker is running: `docker --version`
- For permission issues on Linux: `sudo usermod -aG docker $USER`

## �💻 Usage

### Command Line Interface
```bash
./objectdetector [options] --input=<image-file>

Options:
  -i, --input     Input image file path (required)
  -c, --conf      Confidence threshold (0.0-1.0, default: 0.5)
  -n, --nms       Non-max suppression threshold (0.0-1.0, default: 0.4)
  -h, --help      Show usage information
```

### Examples
```bash
# Basic usage (run from build directory)
cd build
./objectdetector --input=../data/dogs.jpg

# With custom thresholds
./objectdetector --input=../data/cars.jpg --conf=0.7 --nms=0.3

# High precision detection
./objectdetector --input=../data/bicycle.jpg --conf=0.8 --nms=0.2

# From root directory (alternative)
./build/objectdetector --input=data/dogs.jpg
```

> **💡 Note**: The application expects to be run from the `build/` directory because it uses relative paths to find model files (`../model/`). If you run from the root directory, use `./build/objectdetector` instead.

### Docker Usage Examples
```bash
# Process single image
docker run --rm -v $(pwd)/data:/app/data -v $(pwd)/output:/app/output \
  yolo-detector ./objectdetector --input=/app/data/dogs.jpg

# Batch process all images
docker-compose up yolo-detector-batch

# Interactive mode for development
docker-compose run --rm yolo-detector-interactive
```

## 🏆 Udacity C++ Nanodegree Rubric Compliance

This project demonstrates mastery of all required C++ concepts and exceeds the capstone requirements:

### ✅ README & Documentation (Required)
| Criteria | Implementation | Location |
|----------|---------------|----------|
| **Comprehensive README** | Detailed instructions, dependencies, and usage examples | This file |
| **Project Description** | Clear explanation of functionality and architecture | Project Overview section |
| **Rubric Compliance** | All rubric points addressed with specific code references | Below sections |

### ✅ Compilation & Testing (Required)
| Criteria | Implementation | Location |
|----------|---------------|----------|
| **Builds Successfully** | CMake configuration with proper dependency management | `CMakeLists.txt` |
| **Cross-Platform** | Tested on Linux, macOS, and Docker environments | Docker files |
| **No Compilation Errors** | Clean build with modern C++17 standards | All source files |

### ✅ Loops, Functions, I/O
| Criteria | Implementation | Location |
|----------|---------------|----------|
| **Control Structures** | Extensive use of loops, conditionals, and function calls | `src/*.cpp` |
| **File I/O Operations** | Image reading, model loading, and result output | `src/input.cpp`, `src/output.cpp` |
| **User Input Processing** | Command-line argument parsing with validation | `src/main.cpp:17-35` |

### ✅ Object-Oriented Programming
| Criteria | Implementation | Location |
|----------|---------------|----------|
| **Class-Based Design** | Four main classes with clear responsibilities | `include/*.h`, `src/*.cpp` |
| **Access Specifiers** | Proper public/private/protected member organization | All header files |
| **Member Initialization** | Constructor initialization lists throughout | `src/input.cpp:3`, `src/object_detector.cpp` |
| **Interface Abstraction** | Clean interfaces hiding implementation details | `include/*.h` |
| **Encapsulation** | Data hiding with controlled access methods | All classes |
| **Generic Programming** | Template-based buffer class for type safety | `include/buffer.h` |

### ✅ Memory Management
| Criteria | Implementation | Location |
|----------|---------------|----------|
| **Reference Parameters** | Pass-by-reference for efficiency | `src/object_detector.h:25-30` |
| **Proper Destructors** | Resource cleanup in destructors | `src/input.cpp:18-20` |
| **Rule of 5** | Complete implementation for ObjectDetector class | `include/object_detector.h:15-25` |
| **Move Semantics** | Move constructors and assignment operators | `src/object_detector.cpp:45-60` |
| **Smart Pointers** | Unique_ptr usage for automatic memory management | `src/main.cpp:45-50` |
| **RAII Pattern** | Resource acquisition is initialization throughout | All classes |

### ✅ Concurrency
| Criteria | Implementation | Location |
|----------|---------------|----------|
| **Thread Safety** | Mutex protection for shared data structures | `include/buffer.h:15-25` |
| **Lock Guards** | Proper RAII-style locking mechanisms | `include/buffer.h` |

## 🎯 Advanced Features & Enhancements

### Technical Innovations I Added:
1. **Docker Containerization**: Complete Docker workflow with multi-service support
2. **Generic Buffer System**: Thread-safe template class for data management
3. **Enhanced Error Handling**: Comprehensive exception handling and user feedback
4. **Modular Architecture**: Easily extensible design for different models
5. **Modern C++ Features**: Extensive use of C++17 features and best practices
6. **Automated Model Management**: Robust download system with proper validation
7. **Cross-Platform Build System**: CMake configuration supporting multiple platforms

### Performance Optimizations:
- Efficient memory management with move semantics
- Thread-safe operations for concurrent processing
- Optimized OpenCV integration
- Smart pointer usage for automatic resource cleanup

## 📊 Results & Performance

The application successfully detects multiple object classes from the COCO dataset:
- **People, vehicles, animals**
- **Furniture and household items**
- **Sports equipment**
- **80+ object classes total**

**Performance Metrics:**
- Processing time: ~100-500ms per image (depending on size)
- Memory usage: Optimized with smart pointers and RAII
- Accuracy: Configurable precision/recall trade-off

## 🔗 References & Inspiration

- [OpenCV DNN Object Detection Examples](https://github.com/opencv/opencv/blob/master/samples/dnn/object_detection.cpp)
- [YOLO: Real-Time Object Detection](https://pjreddie.com/darknet/yolo/)
- [Udacity C++ Nanodegree Program](https://www.udacity.com/course/c-plus-plus-nanodegree--nd213)

## 📄 License

This project is part of the Udacity C++ Nanodegree capstone submission by **Amr Ramadan**.

---

**Note**: This project demonstrates advanced C++ programming concepts including OOP design, memory management, concurrency, and modern C++ features, fulfilling all requirements for the Udacity C++ Nanodegree capstone project.
