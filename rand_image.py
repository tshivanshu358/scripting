#pip install pillow
#python script for generating images


from PIL import Image
import numpy as np
import os

def generate_random_image(file_path, width, height):
    # Generate random pixel data
    random_data = np.random.rand(height, width, 3) * 255
    random_data = random_data.astype(np.uint8)

    # Create an image from the random data
    img = Image.fromarray(random_data, 'RGB')
    img.save(file_path)

def generate_random_images(num_images, width, height, directory):
    if not os.path.exists(directory):
        os.makedirs(directory)
    
    for i in range(num_images):
        file_path = os.path.join(directory, f'random_image_{i+1}.jpg')
        generate_random_image(file_path, width, height)

# Generate 10 random images, each with a resolution of 1920x1080 pixels
generate_random_images(10, 1920, 1080, 'random_images')
