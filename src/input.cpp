#include "input.h"

Input::Input(std::string &input_path) {
    end_of_file_ = false;
    input_path_ = input_path;
    std::ifstream image_stream(input_path);
    if (!image_stream) {
        throw std::runtime_error("[ERROR:] Cannot open input file\n");
    }
}

bool Input::EndOfFile() {
    return end_of_file_;
}

Input::~Input() {
    // No resources to release for static image loading
}

bool Input::GetImageFrame(cv::Mat &frame) {
    if (!Input::EndOfFile()) {
        frame = cv::imread(input_path_, cv::IMREAD_COLOR);
        if (frame.empty()) {
            throw std::runtime_error("[ERROR:] Could not read image: " + input_path_);
        }
    }
    end_of_file_ = true;
    return !frame.empty();
}
