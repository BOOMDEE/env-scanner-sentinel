echo "========================================="

# 3. 如果发现漏洞，触发 Resend API 但不熔断 / Trigger Resend API if leaks found, BUT DO NOT ABORT
if [ "$ERROR_COUNT" -gt 0 ]; then
  echo "🚨 发现 $ERROR_COUNT 个泄露仓库！正在静默发送邮件... / Found leaks! Silently sending email..."

  # 构建邮件 JSON 负载 / Construct Email JSON Payload
  JSON_DATA=$(cat <<EOF
{
  "from": "Env Sentinel <onboarding@resend.dev>",
  "to": "$TO_EMAIL",
  "subject": "🚨 [警告] Env Sentinel 发现了您的源码泄露！",
  "text": "你好！Env Sentinel 在您的 GitHub 账户中扫描到了潜在的安全泄露。\\n\\n泄露仓库列表如下：\\n$LEAKED_REPOS\\n请立刻前往 GitHub 处理！"
}
EOF
)

  # 调用 Resend 发信 / Call Resend API to send mail
  RESPONSE=$(curl -s -X POST https://api.resend.com/emails \
    -H "Authorization: Bearer $RESEND_KEY" \
    -H "Content-Type: application/json" \
    -d "$JSON_DATA")

  echo "✉️ 邮件发送响应 / Email response: $RESPONSE"
  
  # 💡 极致 ROI 技巧：使用 GitHub 特殊日志语法输出警告，但保持 exit 0 正常通过
  echo "::warning title=Env Sentinel Warning::发现了 $ERROR_COUNT 处潜在的密钥泄露，邮件已发送。/ Found $ERROR_COUNT potential leaks, email sent."
  
  exit 0 # ✅ 正常退出，流水线继续往下跑！
else
  echo "✅ 所有仓库安全！/ All repositories are safe!"
  exit 0
fi
