# Contributing to C++ YOLO Object Detector

Thank you for your interest in contributing to this project! This document provides guidelines for contributing to the C++ YOLO Object Detector.

## Development Setup

### Prerequisites
- C++17 compatible compiler (GCC 7+, Clang 5+, MSVC 2019+)
- CMake 3.11+
- OpenCV 4.1+
- Docker (optional, for containerized development)

### Getting Started
```bash
git clone https://github.com/amr-f-ramadan/cpp-yolo-object-detector.git
cd cpp-yolo-object-detector
mkdir build && cd build
cmake ..
make
```

## Code Standards

### C++ Style Guidelines
- Follow modern C++17 practices
- Use RAII for resource management
- Prefer smart pointers over raw pointers
- Use const-correctness throughout
- Follow the Rule of 5 for classes with custom destructors

### Code Formatting
- Use consistent indentation (4 spaces)
- Maximum line length: 100 characters
- Use descriptive variable and function names
- Add comments for complex algorithms

### Memory Management
- Always use smart pointers for dynamic allocation
- Implement proper move semantics where applicable
- Follow RAII patterns for resource cleanup
- Use const references for read-only parameters

## Testing

### Unit Tests
Run the test suite before submitting:
```bash
cd build
./objectdetector --input=../data/people.jpg --conf=0.5
./objectdetector --input=../data/cars.jpg --conf=0.7
```

### Docker Testing
```bash
docker-compose up yolo-detector-batch
```

## Contribution Process

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
4. **Test thoroughly**
5. **Commit with descriptive messages**
6. **Push to your fork**
7. **Create a Pull Request**

## Pull Request Guidelines

### PR Description
- Clearly describe the problem being solved
- Explain the solution approach
- List any breaking changes
- Include test results

### Code Review Checklist
- [ ] Code follows project style guidelines
- [ ] All tests pass
- [ ] Documentation is updated
- [ ] Memory management is proper
- [ ] No memory leaks
- [ ] Thread safety considered (if applicable)

## Issue Reporting

### Bug Reports
When reporting bugs, include:
- Operating system and version
- Compiler version
- OpenCV version
- Input image details
- Expected vs actual behavior
- Error messages and stack traces

### Feature Requests
For new features, provide:
- Use case description
- Proposed implementation approach
- Potential impact on existing code
- Performance considerations

## Development Areas

### Current Focus Areas
1. **Performance Optimization**
   - GPU acceleration support
   - Multi-threading improvements
   - Memory usage optimization

2. **Feature Enhancements**
   - Support for additional YOLO models
   - Real-time video processing
   - Batch processing improvements

3. **Platform Support**
   - Windows build improvements
   - ARM architecture support
   - Mobile platform compatibility

### Architecture Improvements
- Plugin system for different models
- Configuration file support
- Metrics and logging framework
- REST API interface

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project.

## Questions?

Feel free to open an issue for questions about contributing or reach out to the maintainers.

---

**Happy Coding!** 🚀
