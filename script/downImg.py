import os
import json
import requests

# 从文件中加载数据
with open("data.json", "r", encoding="utf-8") as file:
    data = json.load(file)

# 创建保存目录
output_dir = "downloaded_images"
os.makedirs(output_dir, exist_ok=True)

# 批量下载图片并更新链接
for item in data:
    image_url = item["link_image"]
    # 将文件名中的空格替换为下划线
    sanitized_name = item["link_name"].replace(" ", "_")
    file_name = f"{sanitized_name}.{image_url.split('.')[-1]}"  # 根据图片后缀设置文件扩展名
    output_path = os.path.join(output_dir, file_name)

    try:
        # 下载图片
        response = requests.get(image_url, stream=True)
        response.raise_for_status()

        # 保存图片到本地
        with open(output_path, "wb") as file:
            for chunk in response.iter_content(1024):
                file.write(chunk)

        # 更新 JSON 数据中的 link_image
        item["link_image"] = f"https://www.ccrice.com/{file_name}"
        print(f"已下载并更新: {file_name}")
    except Exception as e:
        print(f"下载失败: {image_url}，错误: {e}")

# 将更新后的数据写回 data.json
with open("data.json", "w", encoding="utf-8") as file:
    json.dump(data, file, ensure_ascii=False, indent=4)

print("所有操作已完成，data.json 已更新。")
