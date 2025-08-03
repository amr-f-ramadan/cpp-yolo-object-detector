# Use Ubuntu 20.04 as base image
FROM ubuntu:20.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set working directory
WORKDIR /app

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    # Build tools
    build-essential \
    cmake \
    make \
    gcc \
    g++ \
    # OpenCV dependencies
    libopencv-dev \
    libopencv-contrib-dev \
    # Network tools for downloading model files
    wget \
    curl \
    # Additional libraries that OpenCV might need
    pkg-config \
    libgtk-3-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    gfortran \
    openexr \
    libatlas-base-dev \
    python3-dev \
    python3-numpy \
    libtbb2 \
    libtbb-dev \
    libdc1394-22-dev \
    # X11 libraries for display (optional)
    libx11-dev \
    libxext-dev \
    # Clean up apt cache to reduce image size
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the entire project to the container
COPY . .

# Download YOLO model files
RUN cd model && \
    chmod +x getModel.sh && \
    ./getModel.sh

# Create build directory and compile the project
RUN mkdir -p build && \
    cd build && \
    cmake .. && \
    make

# Set the working directory to build for running the executable
WORKDIR /app/build

# Expose a volume for input/output data
VOLUME ["/app/data", "/app/output"]

# Default command to show help
CMD ["./objectdetector", "--help"]
