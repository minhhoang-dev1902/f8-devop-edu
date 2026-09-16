RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

services=("nginx" "sshd")

for service in "${services[@]}"; do
    status=$(systemctl is-active "$service" 2>/dev/null)

    if [ "$status" == "active" ]; then
        echo -e "[${GREEN}OK${NC}] Dịch vụ '$service' đang chạy bình thường."
    else
        echo -e "[${RED}CẢNH BÁO${NC}] Dịch vụ '$service' đã CHẾT (trạng thái: $status)!"
    fi
done
