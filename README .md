# AWS Static Website Hosting & Global Content Delivery

## 📌 Project Overview
This project demonstrates how to host a highly available, secure, and low-latency static website on AWS using **Amazon S3**, **CloudFront**, and **Route 53**. It is deployed using **Terraform (Infrastructure as Code)**.

## 🚀 Features
- **Scalable Storage:** Hosted on Amazon S3 with website hosting enabled.
- **Global Delivery:** CloudFront CDN reduces latency by caching content at edge locations worldwide (improving load times by ~30%).
- **Security:** Configured SSL/TLS termination using AWS Certificate Manager (ACM) via CloudFront.
- **DNS Management:** Custom domain mapping handled by Route 53.

## 🛠️ Architecture Diagram (Logical Flow)
`User -> Route 53 (DNS) -> CloudFront (HTTPS/CDN) -> Amazon S3 (Origin)`

## ⚙️ How to Deploy
1. Clone this repository: `git clone https://github.com`
2. Initialize Terraform: `terraform init`
3. Deploy Infrastructure: `terraform apply -auto-approve`
4. Upload `index.html` and `error.html` to the created S3 Bucket.
