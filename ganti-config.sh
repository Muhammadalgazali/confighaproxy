#!/bin/bash

# Fungsi untuk mengganti konfigurasi HAProxy
ganti_konfigurasi() {
  case $1 in
    rr)
      cp /etc/haproxy/haproxyrr.cfg /etc/haproxy/haproxy.cfg
      echo "Menggunakan konfigurasi Round Robin (rr)"
      ;;
    wlc11)
      cp /etc/haproxy/haproxywlc11.cfg /etc/haproxy/haproxy.cfg
      echo "Menggunakan konfigurasi Weighted Least Connection (lc) 1:1 "
      ;;
    wlc12)
      cp /etc/haproxy/haproxywlc12.cfg /etc/haproxy/haproxy.cfg
      echo "Menggunakan konfigurasi Weighted Least Connection (lc) 1:2 "
      ;;
    wlc13)
      cp /etc/haproxy/haproxywlc13.cfg /etc/haproxy/haproxy.cfg
      echo "Menggunakan konfigurasi Weighted Least Connection (lc) 1:3 "
      ;;
    wlc23)
      cp /etc/haproxy/haproxywlc23.cfg /etc/haproxy/haproxy.cfg
      echo "Menggunakan konfigurasi Weighted Least Connection (lc) 2:3 "
      ;;
    wlc23fo)
      cp /etc/haproxy/haproxywlc23fo.cfg /etc/haproxy/haproxy.cfg
      echo "Menggunakan konfigurasi Weighted Least Connection (lc) 2:3 Failover"
      ;;
    *)
      echo "Usage: $0 {rr|wlc11|wlc12|wlc13|wlc23|wlc23fo}"
      exit 1
      ;;
  esac

  # Restart HAProxy untuk menerapkan perubahan konfigurasi
  systemctl restart haproxy
  echo "HAProxy telah di-restart dengan konfigurasi baru"
}

# Panggil fungsi dengan argumen yang diberikan oleh pengguna
ganti_konfigurasi $1
