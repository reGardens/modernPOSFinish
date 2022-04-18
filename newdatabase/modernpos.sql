-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Agu 2020 pada 17.57
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `modernpos`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(10) NOT NULL,
  `account_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `account_details` text NOT NULL,
  `initial_balance` decimal(25,4) NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone_number` varchar(14) DEFAULT NULL,
  `opening_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `url` text CHARACTER SET utf8 DEFAULT NULL,
  `total_deposit` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_withdraw` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_transfer_from_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `total_transfer_to_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_account_to_store`
--

CREATE TABLE `bank_account_to_store` (
  `ba2s` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `deposit` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `withdraw` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `transfer_from_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `transfer_to_other` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_transaction_info`
--

CREATE TABLE `bank_transaction_info` (
  `info_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `account_id` int(10) UNSIGNED NOT NULL,
  `ref_no` varchar(100) NOT NULL COMMENT 'e.g. Transaction ID, Check No.',
  `transaction_type` text NOT NULL,
  `title` varchar(250) NOT NULL,
  `details` text DEFAULT NULL,
  `from_account_id` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `image` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_transaction_price`
--

CREATE TABLE `bank_transaction_price` (
  `price_id` int(10) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `ref_no` varchar(100) NOT NULL COMMENT 'e.g. Transaction ID, Check No.',
  `amount` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `boxes`
--

CREATE TABLE `boxes` (
  `box_id` int(10) UNSIGNED NOT NULL,
  `box_name` varchar(100) NOT NULL,
  `box_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `boxes`
--

INSERT INTO `boxes` (`box_id`, `box_name`, `box_details`) VALUES
(1, 'Common Box', 'Common Box details here...');

-- --------------------------------------------------------

--
-- Struktur dari tabel `box_to_store`
--

CREATE TABLE `box_to_store` (
  `id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `box_to_store`
--

INSERT INTO `box_to_store` (`id`, `box_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `buying_info`
--

CREATE TABLE `buying_info` (
  `info_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET latin1 NOT NULL,
  `inv_type` enum('buy','transfer','') NOT NULL DEFAULT 'buy',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `total_item` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('stock','using','','') NOT NULL DEFAULT 'stock',
  `total_sell` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `buy_date` date NOT NULL,
  `buy_time` time DEFAULT NULL,
  `sup_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `invoice_note` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `is_visible` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `payment_status` varchar(20) NOT NULL DEFAULT 'due',
  `checkout_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `buying_info`
--

INSERT INTO `buying_info` (`info_id`, `invoice_id`, `inv_type`, `store_id`, `total_item`, `status`, `total_sell`, `buy_date`, `buy_time`, `sup_id`, `invoice_note`, `attachment`, `is_visible`, `payment_status`, `checkout_status`, `created_by`, `created_at`, `updated_at`) VALUES
(5, '456456', 'buy', 1, 1, 'stock', 0, '2020-08-01', '08:27:00', 9, '', NULL, 1, 'paid', 1, 1, '2020-08-01 01:27:00', '2020-08-01 13:28:51'),
(6, '123456', 'buy', 1, 1, 'stock', 0, '2020-08-01', '08:39:00', 9, '', NULL, 1, 'paid', 1, 1, '2020-08-01 01:39:00', '2020-08-01 13:39:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buying_item`
--

CREATE TABLE `buying_item` (
  `id` int(10) NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET latin1 NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `item_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `category_id` int(10) NOT NULL DEFAULT 0,
  `item_name` varchar(100) NOT NULL,
  `item_buying_price` decimal(25,4) NOT NULL,
  `item_selling_price` decimal(25,4) NOT NULL,
  `item_quantity` int(10) UNSIGNED NOT NULL,
  `total_sell` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('stock','active','sold','') NOT NULL DEFAULT 'stock',
  `item_total` decimal(25,4) NOT NULL,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `tax_method` enum('exclusive','inclusive','','') DEFAULT 'exclusive',
  `tax` varchar(20) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `buying_item`
--

INSERT INTO `buying_item` (`id`, `invoice_id`, `store_id`, `item_id`, `category_id`, `item_name`, `item_buying_price`, `item_selling_price`, `item_quantity`, `total_sell`, `status`, `item_total`, `item_tax`, `tax_method`, `tax`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(5, '456456', 1, 58, 16, 'lenovo lenovo', '3000000.0000', '3500000.0000', 50, 50, 'sold', '150000000.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000'),
(6, '123456', 1, 59, 17, 'lenovo', '3000000.0000', '3500000.0000', 50, 44, 'active', '150000000.0000', '0.0000', 'inclusive', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buying_payments`
--

CREATE TABLE `buying_payments` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'purchase',
  `store_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `pmethod_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `details` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `total_paid` decimal(25,4) DEFAULT 0.0000,
  `balance` decimal(25,4) DEFAULT 0.0000,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `buying_payments`
--

INSERT INTO `buying_payments` (`id`, `type`, `store_id`, `invoice_id`, `reference_no`, `pmethod_id`, `transaction_id`, `amount`, `details`, `attachment`, `note`, `total_paid`, `balance`, `created_by`, `created_at`) VALUES
(1, 'purchase', 1, '001', NULL, NULL, NULL, '100000000.0000', NULL, NULL, '', '100000000.0000', '0.0000', 1, '2020-07-10 04:19:00'),
(2, 'purchase', 1, '15651651', NULL, NULL, NULL, '3000000.0000', NULL, NULL, '', '3000000.0000', '0.0000', 1, '2020-08-01 01:48:00'),
(4, 'purchase', 1, '789456123', NULL, NULL, NULL, '6000000.0000', NULL, NULL, 'lklk', '6000000.0000', '0.0000', 1, '2020-08-01 03:36:00'),
(5, 'purchase', 1, '456456', NULL, NULL, NULL, '150000000.0000', NULL, NULL, '', '150000000.0000', '0.0000', 1, '2020-08-01 01:27:00'),
(6, 'purchase', 1, '123456', NULL, NULL, NULL, '150000000.0000', NULL, NULL, '', '150000000.0000', '0.0000', 1, '2020-08-01 01:39:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buying_price`
--

CREATE TABLE `buying_price` (
  `price_id` int(10) NOT NULL,
  `invoice_id` varchar(100) CHARACTER SET latin1 NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `order_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payable_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `paid_amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `due_paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `buying_price`
--

INSERT INTO `buying_price` (`price_id`, `invoice_id`, `store_id`, `order_tax`, `item_tax`, `cgst`, `sgst`, `igst`, `payable_amount`, `paid_amount`, `due_paid`, `due`) VALUES
(5, '456456', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '150000000.0000', '150000000.0000', '0.0000', '0.0000'),
(6, '123456', 1, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '150000000.0000', '150000000.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buying_returns`
--

CREATE TABLE `buying_returns` (
  `id` int(11) NOT NULL,
  `store_id` int(10) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `sup_id` int(10) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total_item` int(10) DEFAULT NULL,
  `total_quantity` int(10) NOT NULL,
  `total_amount` decimal(25,4) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buying_return_items`
--

CREATE TABLE `buying_return_items` (
  `id` int(11) NOT NULL,
  `store_id` int(10) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `amount` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorys`
--

CREATE TABLE `categorys` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(60) CHARACTER SET utf8 NOT NULL,
  `category_slug` varchar(60) CHARACTER SET utf8 NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `category_details` longtext CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `categorys`
--

INSERT INTO `categorys` (`category_id`, `category_name`, `category_slug`, `parent_id`, `category_details`, `created_at`, `update_at`) VALUES
(1, 'Default category', 'default_category', 0, '', '2018-08-17 05:28:16', '2020-07-09 07:04:31'),
(16, 'laptop', 'laptop', 0, '', '2020-08-01 01:38:17', '2020-08-01 01:38:17'),
(17, 'LAPTOP ASUS', 'laptop_asus', 0, '', '2020-08-01 01:45:06', '2020-08-01 01:45:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_to_store`
--

CREATE TABLE `category_to_store` (
  `c2s_id` int(10) NOT NULL,
  `ccategory_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category_to_store`
--

INSERT INTO `category_to_store` (`c2s_id`, `ccategory_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 1, 1, 1, 0),
(2, 16, 1, 1, 1),
(3, 17, 1, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` decimal(25,4) NOT NULL DEFAULT 1.0000,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `created_at`) VALUES
(1, 'Rupiah', 'IDR', 'Rp.', '', '3', '0.6125', '2018-09-19 14:40:00'),
(2, 'United States Dollar', 'USD', '$', '', '2', '1.0000', '2018-09-19 14:40:00'),
(3, 'Euro', 'EUR', '', '€', '2', '0.7846', '2018-09-19 14:40:00'),
(4, 'Hong Kong Dollar', 'HKD', 'HK$', '', '2', '7.8222', '2018-09-19 12:00:00'),
(5, 'Indian Rupee', 'INR', '₹', '', '2', '64.4000', '2018-09-19 12:00:00'),
(6, 'Russian Ruble', 'RUB', '₽', '', '2', '56.4036', '2018-09-19 12:00:00'),
(7, 'Chinese Yuan Renminbi', 'CNY', '¥', '', '2', '6.3451', '2018-09-19 12:00:00'),
(8, 'Australian Dollar', 'AUD', '$', '', '2', '1.2654', '2018-09-19 12:00:00'),
(9, 'Bangladeshi Taka', 'BDT', '৳', '', '3', '0.0000', '2018-09-29 05:25:00'),
(10, 'Pakistani Rupee ', 'PKR', '₨', '', '2', '0.0000', '2018-09-29 05:31:49'),
(11, 'Croatian Kuna', 'HRK', 'kn', '', '2', '0.0000', '2018-09-29 05:33:22'),
(12, 'Malaysian Ringgit', 'MYR', 'RM', '', '2', '0.0000', '2018-09-29 05:35:15'),
(13, 'Saudi riyal', 'SAR', 'SR', '', '2', '0.0000', '2018-09-29 05:35:57'),
(14, 'Canadian Dollar', 'CAD', 'CAD $', '', '2', '0.0000', '2018-09-29 05:37:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `currency_to_store`
--

CREATE TABLE `currency_to_store` (
  `ca2s_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `currency_to_store`
--

INSERT INTO `currency_to_store` (`ca2s_id`, `currency_id`, `store_id`, `status`, `sort_order`) VALUES
(3, 3, 1, 1, 0),
(4, 4, 1, 1, 0),
(5, 5, 1, 1, 0),
(6, 6, 1, 1, 0),
(7, 7, 1, 1, 0),
(8, 8, 1, 1, 0),
(17, 9, 1, 1, 0),
(19, 2, 1, 1, 0),
(23, 10, 1, 1, 0),
(25, 11, 1, 1, 0),
(27, 12, 1, 1, 0),
(31, 13, 1, 1, 0),
(33, 14, 1, 1, 0),
(37, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_mobile` varchar(14) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `customer_sex` tinyint(1) NOT NULL DEFAULT 1,
  `customer_age` int(10) UNSIGNED DEFAULT NULL,
  `customer_city` varchar(100) DEFAULT NULL,
  `customer_state` varchar(100) DEFAULT NULL,
  `customer_country` varchar(100) DEFAULT NULL,
  `is_giftcard` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_mobile`, `customer_address`, `customer_sex`, `customer_age`, `customer_city`, `customer_state`, `customer_country`, `is_giftcard`, `created_at`) VALUES
(1, 'Pelanggan 1', 'c5fbfb@gmail.com', '0877171771171', '', 1, 29, '', '', 'ID', 0, '2020-07-10 11:25:53'),
(4, 'juctice', 'jucticefunction@gmail.com', '5555', 'Jelambar baru jl.S gg.R no.47c kel.jelambar kec.grogolpetamburan jakarta barat', 1, 23, 'Jakarta barat', 'Indonesia', 'ID', 0, '2020-08-01 10:44:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_to_store`
--

CREATE TABLE `customer_to_store` (
  `c2s_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `balance` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `customer_to_store`
--

INSERT INTO `customer_to_store` (`c2s_id`, `customer_id`, `store_id`, `balance`, `status`, `sort_order`) VALUES
(1, 1, 1, '0.0000', 1, 0),
(2, 4, 1, '0.0000', 1, 1),
(3, 1, 1, '0.0000', 1, 0),
(4, 4, 1, '0.0000', 1, 1),
(5, 4, 1, '0.0000', 1, 12),
(6, 4, 1, '0.0000', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_transactions`
--

CREATE TABLE `customer_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(55) DEFAULT NULL,
  `ref_invoice_id` varchar(55) DEFAULT NULL,
  `type` varchar(55) NOT NULL,
  `pmethod_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `store_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer_transactions`
--

INSERT INTO `customer_transactions` (`id`, `customer_id`, `reference_no`, `ref_invoice_id`, `type`, `pmethod_id`, `description`, `amount`, `store_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'CT200710100001', '200710100001', 'purchase', 1, 'Paid while purchasing', '40000.0000', 1, 1, '2020-07-10 04:26:16', '2020-07-10 04:26:17'),
(2, 1, 'CT2007101002', '200710100002', 'purchase', 1, 'Paid while purchasing', '20000.0000', 1, 1, '2020-07-10 04:26:38', '2020-07-10 04:26:39'),
(3, 1, 'CT20080111003', '200801100001', 'purchase', 4, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 03:30:24', '2020-08-01 03:30:25'),
(4, 2, 'CT20080111004', '200801100002', 'purchase', 1, 'Paid while purchasing', '10000000.0000', 1, 1, '2020-08-01 03:37:58', '2020-08-01 03:37:59'),
(5, 2, 'CT200801100001', '200801100002', 'due', 1, 'Due while purchasing', '8000000.0000', 1, 1, '2020-08-01 03:37:58', '2020-08-01 03:38:00'),
(6, 2, 'CT200801100001', '200801100002', 'due_paid', 7, 'Due paid by customer', '8000000.0000', 1, 1, '2020-08-01 03:38:53', '2020-08-01 03:38:53'),
(7, 1, 'CT20080111005', '200801100001', 'purchase', 1, 'Paid while purchasing', '175000000.0000', 1, 1, '2020-08-01 13:31:17', '2020-08-01 13:31:17'),
(8, 4, 'CT20080111006', '200801100002', 'purchase', 1, 'Paid while purchasing', '35000000.0000', 1, 1, '2020-08-01 13:47:20', '2020-08-01 13:47:21'),
(9, 1, 'CT20080111007', '200801100003', 'purchase', 1, 'Paid while purchasing', '7000000.0000', 1, 1, '2020-08-01 13:48:21', '2020-08-01 13:48:21'),
(10, 1, 'CT20080111008', '200801100004', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 13:55:17', '2020-08-01 13:55:17'),
(11, 1, 'CT20080111009', '200801100005', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 13:57:17', '2020-08-01 13:57:19'),
(12, 1, 'CT20080111010', '200801100006', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 13:59:46', '2020-08-01 13:59:47'),
(13, 1, 'CT20080111011', '200801100007', 'purchase', 1, 'Paid while purchasing', '10500000.0000', 1, 1, '2020-08-01 14:00:01', '2020-08-01 14:00:03'),
(14, 1, 'CT20080111012', '200801100008', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 14:01:09', '2020-08-01 14:01:10'),
(15, 1, 'CT20080111013', '200801100009', 'purchase', 1, 'Paid while purchasing', '7000000.0000', 1, 1, '2020-08-01 14:02:10', '2020-08-01 14:02:11'),
(16, 1, 'CT20080111014', '200801100010', 'purchase', 1, 'Paid while purchasing', '7000000.0000', 1, 1, '2020-08-01 14:04:17', '2020-08-01 14:04:17'),
(17, 1, 'CT20080111015', '200801100011', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 14:06:00', '2020-08-01 14:06:01'),
(18, 1, 'CT20080111016', '200801100012', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 14:09:38', '2020-08-01 14:09:39'),
(19, 1, 'CT20080111017', '200801100013', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 14:15:34', '2020-08-01 14:15:36'),
(20, 1, 'CT20080111018', '200801100014', 'purchase', 1, 'Paid while purchasing', '10500000.0000', 1, 1, '2020-08-01 14:16:13', '2020-08-01 14:16:14'),
(21, 1, 'CT20080111019', '200801100015', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 14:18:37', '2020-08-01 14:18:38'),
(22, 1, 'CT20080111020', '200801100016', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 14:23:45', '2020-08-01 14:23:45'),
(23, 1, 'CT20080111021', '200801100017', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 14:24:10', '2020-08-01 14:24:11'),
(24, 1, 'CT20080111022', '200801100018', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 14:33:35', '2020-08-01 14:33:36'),
(25, 1, 'CT20080111023', '200801100017', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 14:44:41', '2020-08-01 14:44:41'),
(26, 1, 'CT20080111024', '200801100018', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 14:54:52', '2020-08-01 14:54:52'),
(27, 1, 'CT20080111025', '200801100019', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 15:01:58', '2020-08-01 15:01:59'),
(28, 1, 'CT20080111026', '200801100020', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 15:02:47', '2020-08-01 15:02:47'),
(29, 1, 'CT20080111027', '200801100021', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 15:05:56', '2020-08-01 15:05:56'),
(30, 1, 'CT20080111028', '200801100022', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 15:06:14', '2020-08-01 15:06:15'),
(31, 1, 'CT20080111029', '200801100023', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 15:07:22', '2020-08-01 15:07:23'),
(32, 1, 'CT20080111030', '200801100024', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 15:07:32', '2020-08-01 15:07:33'),
(33, 1, 'CT20080111031', '200801100025', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 15:13:31', '2020-08-01 15:13:32'),
(34, 1, 'CT20080111032', '200801100026', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 15:24:47', '2020-08-01 15:24:47'),
(35, 1, 'CT20080111033', '200801100027', 'purchase', 1, 'Paid while purchasing', '3500000.0000', 1, 1, '2020-08-01 15:35:29', '2020-08-01 15:35:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` longtext CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expense_categorys`
--

CREATE TABLE `expense_categorys` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(60) CHARACTER SET utf8 NOT NULL,
  `category_slug` varchar(60) CHARACTER SET utf8 NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `category_details` longtext CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `expense_categorys`
--

INSERT INTO `expense_categorys` (`category_id`, `category_name`, `category_slug`, `parent_id`, `category_details`, `status`, `sort_order`, `created_at`, `update_at`) VALUES
(3, 'Expense Category', 'expense_category', 0, '', 1, 0, '2019-02-06 12:59:08', '2020-07-09 07:04:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gift_card_topups`
--

CREATE TABLE `gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `card_id` varchar(20) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `loans`
--

CREATE TABLE `loans` (
  `loan_id` int(10) UNSIGNED NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `loan_from` varchar(100) CHARACTER SET utf8 NOT NULL,
  `title` varchar(250) CHARACTER SET utf8 NOT NULL,
  `amount` decimal(25,4) UNSIGNED NOT NULL,
  `interest` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `payable` decimal(25,4) UNSIGNED NOT NULL,
  `paid` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) UNSIGNED NOT NULL DEFAULT 0.0000,
  `details` longtext CHARACTER SET utf8 NOT NULL,
  `attachment` text NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `loans`
--

INSERT INTO `loans` (`loan_id`, `ref_no`, `loan_from`, `title`, `amount`, `interest`, `payable`, `paid`, `due`, `details`, `attachment`, `created_by`, `created_at`, `updated_at`) VALUES
(11, '2222', 'bank', '43434', '3000.0000', '1.0000', '3030.0000', '0.0000', '3030.0000', '', '', 1, '2019-02-11 18:00:00', '2020-07-09 07:04:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `loan_payments`
--

CREATE TABLE `loan_payments` (
  `id` int(11) UNSIGNED NOT NULL,
  `lloan_id` int(11) UNSIGNED NOT NULL,
  `ref_no` varchar(50) DEFAULT NULL,
  `paid` decimal(25,4) NOT NULL,
  `note` text CHARACTER SET utf8 DEFAULT NULL,
  `created_by` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `loan_payments`
--

INSERT INTO `loan_payments` (`id`, `lloan_id`, `ref_no`, `paid`, `note`, `created_by`, `created_at`, `updated_at`) VALUES
(10, 10, '232423', '20000.0000', '', 1, '2019-02-10 12:44:08', '2020-07-09 07:04:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `loan_to_store`
--

CREATE TABLE `loan_to_store` (
  `id` int(11) UNSIGNED NOT NULL,
  `lloan_id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'sell',
  `store_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `pmethod_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `details` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `total_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`id`, `type`, `store_id`, `invoice_id`, `reference_no`, `pmethod_id`, `transaction_id`, `amount`, `details`, `attachment`, `note`, `total_paid`, `pos_balance`, `created_by`, `created_at`) VALUES
(1, 'sell', 1, '200710100001', NULL, 1, NULL, '40000.0000', 'a:0:{}', NULL, '', '40000.0000', '0.0000', 1, '2020-07-10 04:26:16'),
(2, 'sell', 1, '200710100002', NULL, 1, NULL, '20000.0000', 'a:0:{}', NULL, '', '50000.0000', '30000.0000', 1, '2020-07-10 04:26:38'),
(3, 'sell', 1, '200801100001', NULL, 4, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 03:30:24'),
(4, 'sell', 1, '200801100002', NULL, 1, NULL, '10000000.0000', 'a:0:{}', NULL, '', '10000000.0000', '0.0000', 1, '2020-08-01 03:37:58'),
(5, 'due_paid', 1, '200801100002', NULL, 7, NULL, '8000000.0000', 'a:0:{}', NULL, '', '8000000.0000', '0.0000', 1, '2020-08-01 03:38:53'),
(6, 'sell', 1, '200801100001', NULL, 1, NULL, '175000000.0000', 'a:0:{}', NULL, '', '175000000.0000', '0.0000', 1, '2020-08-01 13:31:17'),
(7, 'sell', 1, '200801100002', NULL, 1, NULL, '35000000.0000', 'a:0:{}', NULL, '', '35000000.0000', '0.0000', 1, '2020-08-01 13:47:20'),
(8, 'sell', 1, '200801100003', NULL, 1, NULL, '7000000.0000', 'a:0:{}', NULL, '', '7000000.0000', '0.0000', 1, '2020-08-01 13:48:21'),
(9, 'sell', 1, '200801100004', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 13:55:17'),
(10, 'sell', 1, '200801100005', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 13:57:17'),
(11, 'sell', 1, '200801100006', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 13:59:46'),
(12, 'sell', 1, '200801100007', NULL, 1, NULL, '10500000.0000', 'a:0:{}', NULL, '', '10500000.0000', '0.0000', 1, '2020-08-01 14:00:01'),
(13, 'sell', 1, '200801100008', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 14:01:09'),
(14, 'sell', 1, '200801100009', NULL, 1, NULL, '7000000.0000', 'a:0:{}', NULL, '', '7000000.0000', '0.0000', 1, '2020-08-01 14:02:10'),
(15, 'sell', 1, '200801100010', NULL, 1, NULL, '7000000.0000', 'a:0:{}', NULL, '', '7000000.0000', '0.0000', 1, '2020-08-01 14:04:17'),
(16, 'sell', 1, '200801100011', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 14:06:00'),
(17, 'sell', 1, '200801100012', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 14:09:38'),
(18, 'sell', 1, '200801100013', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 14:15:34'),
(19, 'sell', 1, '200801100014', NULL, 1, NULL, '10500000.0000', 'a:0:{}', NULL, '', '10500000.0000', '0.0000', 1, '2020-08-01 14:16:13'),
(20, 'sell', 1, '200801100015', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 14:18:37'),
(21, 'sell', 1, '200801100016', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 14:23:45'),
(24, 'sell', 1, '200801100017', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 14:44:41'),
(25, 'sell', 1, '200801100018', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 14:54:52'),
(26, 'sell', 1, '200801100019', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 15:01:58'),
(27, 'sell', 1, '200801100020', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 15:02:47'),
(28, 'sell', 1, '200801100021', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 15:05:56'),
(29, 'sell', 1, '200801100022', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 15:06:14'),
(30, 'sell', 1, '200801100023', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 15:07:22'),
(31, 'sell', 1, '200801100024', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 15:07:32'),
(32, 'sell', 1, '200801100025', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 15:13:31'),
(33, 'sell', 1, '200801100026', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 15:24:47'),
(34, 'sell', 1, '200801100027', NULL, 1, NULL, '3500000.0000', 'a:0:{}', NULL, '', '3500000.0000', '0.0000', 1, '2020-08-01 15:35:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pmethods`
--

CREATE TABLE `pmethods` (
  `pmethod_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pmethods`
--

INSERT INTO `pmethods` (`pmethod_id`, `name`, `details`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 'pembayaran secara cash', '2018-03-23 18:00:00', '2020-07-31 06:48:10'),
(2, 'Transfer', 'Virtual Wallet', '2018-10-05 18:00:00', '2020-07-31 06:54:39'),
(4, 'GoPay', 'Pembayaran melalui gopay', '2019-01-09 18:00:00', '2020-07-31 06:52:32'),
(7, 'OVO', 'Pembayaran melalui OVO', '2019-01-14 18:00:00', '2020-07-31 06:52:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pmethod_to_store`
--

CREATE TABLE `pmethod_to_store` (
  `p2s_id` int(11) NOT NULL,
  `ppmethod_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pmethod_to_store`
--

INSERT INTO `pmethod_to_store` (`p2s_id`, `ppmethod_id`, `store_id`, `status`, `sort_order`) VALUES
(39, 1, 1, 1, 1),
(40, 4, 1, 1, 3),
(41, 7, 1, 1, 4),
(42, 2, 1, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_receipt_template`
--

CREATE TABLE `pos_receipt_template` (
  `id` int(10) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `content` longtext CHARACTER SET ucs2 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sort_order` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `store_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pos_receipt_template`
--

INSERT INTO `pos_receipt_template` (`id`, `title`, `content`, `created_at`, `updated_at`, `sort_order`, `status`, `created_by`, `is_active`, `store_id`) VALUES
(1, 'Default', '\r\n\r\n  \r\n    \r\n      \r\n        \r\n      \r\n      \r\n        \r\n        \r\n      \r\n    \r\n  \r\n\r\n          \r\n\r\n            \r\n\r\n              {logo}\r\n            \r\n\r\n            \r\n{store_name}\r\n\r\n            \r\nGST Reg: {gst_reg}\r\n\r\n            \r\nVAT Reg: {vat_reg}\r\n\r\n            \r\n\r\n              Invoice ID: {invoice_id}                                                            \r\n            \r\n\r\n            \r\n\r\n              Date: {date_time}\r\n            \r\n\r\n            \r\nTax Invoice\r\n\r\n        \r\n\r\n          \r\n\r\n            \r\n\r\n              \r\n\r\n                \r\n                  From                              \r\n                \r\n              \r\n\r\n              \r\n                {store_address}                           \r\n              \r\n              \r\n\r\n              \r\n                Mobile: {store_contact}                          \r\n              \r\n            \r\n\r\n          \r\n\r\n        	  \r\n          \r\n\r\n            \r\n              To                          \r\n            \r\n          \r\n\r\n          \r\n\r\n            Customer: {customer_name} \r\n            \r\n              \r\n            \r\n          \r\n\r\n          \r\n\r\n            Customer Contact: {customer_contact}                        \r\n          \r\n\r\n        \r\n\r\n  \r\n  \r\n    \r\n      \r\n        \r\n  				\r\n  				\r\n          \r\n  				\r\n  				\r\n  			\r\n      \r\n      \r\n        \r\n          \r\n          \r\n          \r\n          \r\n          \r\n                      \r\n      \r\n    \r\n\r\n            Sl.No.                        \r\n          	\r\n            Product Name                        \r\n          	\r\n            Quantity                        \r\n          	\r\n            Price                        \r\n          	\r\n            Total                        \r\n          \r\n\r\n            #1                            \r\n          	\r\n            ajke 2                                                                                                              \r\n          	\r\n            x 1 box                            \r\n          	\r\n            120.00                            \r\n          	\r\n            120.00                            \r\n          \r\n\r\n  \r\n\r\n  \r\n\r\n    \r\n      \r\n        \r\n        	\r\n        	\r\n        \r\n        \r\n        	\r\n        	\r\n        \r\n        \r\n          \r\n          \r\n        \r\n        \r\n        	\r\n        	\r\n        \r\n        \r\n          \r\n          \r\n        \r\n        \r\n          \r\n          \r\n        \r\n      \r\n    \r\n\r\n            Sub Total                        \r\n          	\r\n            120.00                        \r\n          \r\n\r\n            Discount                        \r\n          	\r\n            0.00                        \r\n          \r\n\r\n            Order Tax                        \r\n          	\r\n            0.00                        \r\n          \r\n\r\n            Payable Amount                        \r\n          	\r\n            120.00                        \r\n          \r\n\r\n            Paid                        \r\n          	\r\n            120.00                        \r\n          \r\n\r\n            Due                        \r\n          	\r\n            0.00                        \r\n          \r\n\r\n  \r\n\r\n  \r\n\r\n    \r\n      \r\n        \r\n          \r\n          \r\n          \r\n                                             \r\n      \r\n    \r\n\r\n            Paid on 2019-01-30 11:47:18 \r\n                                                  (via Cash on Delivery)\r\n                                                  by Admin                                                          \r\n          	\r\n            Amount:  120.00                                                          \r\n          	\r\n             \r\n          \r\n\r\n  \r\n\r\n  \r\nTax Summary\r\n\r\n  \r\n    \r\n      \r\n        \r\n        \r\n        \r\n        \r\n        \r\n      \r\n    \r\n    \r\n      \r\n        \r\n        \r\n        \r\n        \r\n        \r\n      \r\n    \r\n    \r\n      \r\n        \r\n        \r\n      \r\n    \r\n  \r\n Name	Code	Qty	Tax Excl	Tax Amount\r\nTax @20%	TTX	1	120.00	0.00\r\nTotal Tax Amount	0.00\r\n\r\n  \r\n\r\n    Thank you for choosing us!\r\n  \r\n\r\n\r\n  \r\n\r\n    {qucode}\r\n  \r\n\r\n  \r\n\r\n    \r\n      \r\n        \r\n          \r\n          \r\n        \r\n      \r\n    \r\n\r\n            \r\n\r\n              \r\n\r\n                Admin                            \r\n              \r\n\r\n              \r\n\r\n                Created By                            \r\n              \r\n\r\n            \r\n\r\n          	\r\n            \r\n\r\n              \r\n\r\n                Cashier                            \r\n              \r\n\r\n              \r\n\r\n                Cashier                            \r\n              \r\n\r\n            \r\n\r\n          \r\n\r\n  \r\n\r\n\r\n', '2019-01-30 07:50:29', '2020-07-09 07:04:31', 0, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `printers`
--

CREATE TABLE `printers` (
  `printer_id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) DEFAULT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `printers`
--

INSERT INTO `printers` (`printer_id`, `title`, `type`, `profile`, `char_per_line`, `created_at`) VALUES
(1, 'Common Printer', 'network', '', 200, '2018-09-27 13:52:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `printer_to_store`
--

CREATE TABLE `printer_to_store` (
  `p2s_id` int(10) NOT NULL,
  `pprinter_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `printer_to_store`
--

INSERT INTO `printer_to_store` (`p2s_id`, `pprinter_id`, `store_id`, `path`, `ip_address`, `port`, `status`, `sort_order`) VALUES
(1, 1, 1, '', '192.234.43.3', '9100', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `p_id` int(10) UNSIGNED NOT NULL,
  `p_code` varchar(50) NOT NULL,
  `hsn_code` varchar(100) DEFAULT NULL,
  `p_name` varchar(100) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unit_id` int(10) UNSIGNED NOT NULL,
  `p_image` varchar(250) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`p_id`, `p_code`, `hsn_code`, `p_name`, `category_id`, `unit_id`, `p_image`, `description`) VALUES
(53, '78706067', NULL, 'LENOVO IDEAPAD 330', 16, 10, '', 'CPU : AMD A4\r\nVGA : AMD Radeon R3\r\nLAYAR : 14 Inch&quot;\r\nRAM : 4 GB'),
(58, '31824030', NULL, 'lenovo lenovo', 16, 12, '', ''),
(59, '43605614', NULL, 'lenovo', 17, 12, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_to_store`
--

CREATE TABLE `product_to_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `buy_price` float NOT NULL DEFAULT 0,
  `sell_price` float NOT NULL DEFAULT 0,
  `quantity_in_stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `alert_quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `box_id` int(10) UNSIGNED NOT NULL,
  `taxrate_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_method` varchar(55) NOT NULL DEFAULT 'inclusive',
  `e_date` date NOT NULL,
  `p_date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `product_to_store`
--

INSERT INTO `product_to_store` (`id`, `product_id`, `store_id`, `buy_price`, `sell_price`, `quantity_in_stock`, `alert_quantity`, `sup_id`, `box_id`, `taxrate_id`, `tax_method`, `e_date`, `p_date`, `status`, `sort_order`) VALUES
(97, 53, 1, 5000000, 8000000, 0, 1, 9, 1, 3, 'inclusive', '2021-02-12', '2020-08-01', 0, 1),
(102, 58, 1, 3000000, 3500000, 0, 100, 9, 1, 3, 'inclusive', '2021-08-01', '2020-08-01', 1, 0),
(103, 59, 1, 3000000, 3500000, 6, 100, 9, 1, 3, 'inclusive', '2021-08-01', '2020-08-01', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `returns`
--

CREATE TABLE `returns` (
  `id` int(11) NOT NULL,
  `store_id` int(10) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total_item` int(10) DEFAULT NULL,
  `total_quantity` int(10) NOT NULL,
  `total_amount` decimal(25,4) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `return_items`
--

CREATE TABLE `return_items` (
  `id` int(11) NOT NULL,
  `store_id` int(10) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `amount` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `selling_info`
--

CREATE TABLE `selling_info` (
  `info_id` int(10) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `edit_counter` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `inv_type` enum('sell') NOT NULL DEFAULT 'sell',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `customer_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `customer_mobile` varchar(20) DEFAULT NULL,
  `ref_invoice_id` varchar(100) DEFAULT NULL,
  `ref_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `invoice_note` text DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `pmethod_id` int(10) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `checkout_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `selling_info`
--

INSERT INTO `selling_info` (`info_id`, `invoice_id`, `edit_counter`, `inv_type`, `store_id`, `customer_id`, `customer_mobile`, `ref_invoice_id`, `ref_user_id`, `invoice_note`, `total_items`, `status`, `pmethod_id`, `payment_status`, `checkout_status`, `created_by`, `created_at`, `updated_at`) VALUES
(5, '200801100001', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 13:31:17', '2020-08-01 13:31:17'),
(6, '200801100002', 0, 'sell', 1, 4, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 13:47:20', '2020-08-01 13:47:21'),
(7, '200801100003', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 13:48:21', '2020-08-01 13:48:21'),
(8, '200801100004', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 13:55:17', '2020-08-01 13:55:17'),
(9, '200801100005', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 13:57:17', '2020-08-01 13:57:18'),
(10, '200801100006', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 13:59:46', '2020-08-01 13:59:47'),
(11, '200801100007', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:00:01', '2020-08-01 14:00:03'),
(12, '200801100008', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:01:09', '2020-08-01 14:01:10'),
(13, '200801100009', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:02:10', '2020-08-01 14:02:10'),
(14, '200801100010', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:04:17', '2020-08-01 14:04:17'),
(15, '200801100011', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:06:00', '2020-08-01 14:06:01'),
(16, '200801100012', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:09:38', '2020-08-01 14:09:39'),
(17, '200801100013', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:15:34', '2020-08-01 14:15:36'),
(18, '200801100014', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:16:13', '2020-08-01 14:16:14'),
(19, '200801100015', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:18:37', '2020-08-01 14:18:38'),
(20, '200801100016', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:23:45', '2020-08-01 14:23:45'),
(23, '200801100017', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:44:41', '2020-08-01 14:44:41'),
(24, '200801100018', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 14:54:52', '2020-08-01 14:54:52'),
(25, '200801100019', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 15:01:58', '2020-08-01 15:01:59'),
(26, '200801100020', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 15:02:47', '2020-08-01 15:02:47'),
(27, '200801100021', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 15:05:56', '2020-08-01 15:05:56'),
(28, '200801100022', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 15:06:14', '2020-08-01 15:06:15'),
(29, '200801100023', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 15:07:22', '2020-08-01 15:07:23'),
(30, '200801100024', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 15:07:32', '2020-08-01 15:07:33'),
(31, '200801100025', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 15:13:31', '2020-08-01 15:13:32'),
(32, '200801100026', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 15:24:47', '2020-08-01 15:24:47'),
(33, '200801100027', 0, 'sell', 1, 1, '', NULL, 0, '', 1, 1, 1, 'paid', 1, 1, '2020-08-01 15:35:29', '2020-08-01 15:35:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `selling_item`
--

CREATE TABLE `selling_item` (
  `id` int(10) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_price` decimal(25,4) NOT NULL,
  `item_discount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `tax_method` enum('exclusive','inclusive','','') NOT NULL DEFAULT 'exclusive',
  `taxrate_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `item_quantity` int(10) UNSIGNED NOT NULL,
  `total_buying_price` decimal(25,4) DEFAULT NULL,
  `item_total` decimal(25,4) NOT NULL,
  `buying_invoice_id` varchar(100) DEFAULT NULL,
  `print_counter` int(10) UNSIGNED DEFAULT 0,
  `print_counter_time` timestamp NULL DEFAULT NULL,
  `printed_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `selling_item`
--

INSERT INTO `selling_item` (`id`, `invoice_id`, `category_id`, `sup_id`, `store_id`, `item_id`, `item_name`, `item_price`, `item_discount`, `item_tax`, `tax_method`, `taxrate_id`, `tax`, `gst`, `cgst`, `sgst`, `igst`, `item_quantity`, `total_buying_price`, `item_total`, `buying_invoice_id`, `print_counter`, `print_counter_time`, `printed_by`, `created_at`) VALUES
(4, '200801100002', 16, 10, 1, 53, 'LENOVO IDEAPAD 330', '8000000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '5000000.0000', '8000000.0000', '159', 0, NULL, NULL, '2020-08-01 03:37:58'),
(6, '200801100001', 16, 9, 1, 58, 'lenovo lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 50, '150000000.0000', '175000000.0000', '456456', 0, NULL, NULL, '2020-08-01 13:31:17'),
(7, '200801100002', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 10, '30000000.0000', '35000000.0000', '123456', 0, NULL, NULL, '2020-08-01 13:47:20'),
(8, '200801100003', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 2, '6000000.0000', '7000000.0000', '123456', 0, NULL, NULL, '2020-08-01 13:48:21'),
(9, '200801100004', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 13:55:17'),
(10, '200801100005', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 13:57:18'),
(11, '200801100006', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 13:59:46'),
(12, '200801100007', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 3, '9000000.0000', '10500000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:00:03'),
(13, '200801100008', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:01:09'),
(14, '200801100009', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 2, '6000000.0000', '7000000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:02:10'),
(15, '200801100010', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 2, '6000000.0000', '7000000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:04:17'),
(16, '200801100011', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:06:00'),
(17, '200801100012', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:09:39'),
(18, '200801100013', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:15:35'),
(19, '200801100014', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 3, '9000000.0000', '10500000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:16:14'),
(20, '200801100015', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:18:38'),
(21, '200801100016', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:23:45'),
(24, '200801100017', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:44:41'),
(25, '200801100018', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 14:54:52'),
(26, '200801100019', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 15:01:58'),
(27, '200801100020', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 15:02:47'),
(28, '200801100021', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 15:05:56'),
(29, '200801100022', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 15:06:14'),
(30, '200801100023', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 15:07:22'),
(31, '200801100024', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 15:07:32'),
(32, '200801100025', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 15:13:31'),
(33, '200801100026', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 15:24:47'),
(34, '200801100027', 17, 9, 1, 59, 'lenovo', '3500000.0000', '0.0000', '0.0000', 'exclusive', 3, NULL, NULL, '0.0000', '0.0000', '0.0000', 1, '3000000.0000', '3500000.0000', '123456', 0, NULL, NULL, '2020-08-01 15:35:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `selling_price`
--

CREATE TABLE `selling_price` (
  `price_id` int(10) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `discount_type` enum('plain','percentage','','') NOT NULL DEFAULT 'plain',
  `discount_amount` decimal(25,4) DEFAULT 0.0000,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `item_tax` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping_type` enum('plain','percentage','','') NOT NULL DEFAULT 'plain',
  `shipping_amount` decimal(25,4) DEFAULT 0.0000,
  `payable_amount` decimal(25,4) DEFAULT NULL,
  `paid_amount` decimal(25,4) NOT NULL,
  `due_paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `due` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `selling_price`
--

INSERT INTO `selling_price` (`price_id`, `invoice_id`, `store_id`, `subtotal`, `discount_type`, `discount_amount`, `order_tax`, `item_tax`, `cgst`, `sgst`, `igst`, `shipping_type`, `shipping_amount`, `payable_amount`, `paid_amount`, `due_paid`, `due`) VALUES
(5, '200801100001', 1, '175000000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '175000000.0000', '175000000.0000', '0.0000', '0.0000'),
(6, '200801100002', 1, '35000000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '35000000.0000', '35000000.0000', '0.0000', '0.0000'),
(7, '200801100003', 1, '7000000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '7000000.0000', '7000000.0000', '0.0000', '0.0000'),
(8, '200801100004', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(9, '200801100005', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(10, '200801100006', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(11, '200801100007', 1, '10500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '10500000.0000', '10500000.0000', '0.0000', '0.0000'),
(12, '200801100008', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(13, '200801100009', 1, '7000000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '7000000.0000', '7000000.0000', '0.0000', '0.0000'),
(14, '200801100010', 1, '7000000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '7000000.0000', '7000000.0000', '0.0000', '0.0000'),
(15, '200801100011', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(16, '200801100012', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(17, '200801100013', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(18, '200801100014', 1, '10500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '10500000.0000', '10500000.0000', '0.0000', '0.0000'),
(19, '200801100015', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(20, '200801100016', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(23, '200801100017', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(24, '200801100018', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(25, '200801100019', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(26, '200801100020', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(27, '200801100021', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(28, '200801100022', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(29, '200801100023', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(30, '200801100024', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(31, '200801100025', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(32, '200801100026', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000'),
(33, '200801100027', 1, '3500000.0000', 'plain', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'plain', '0.0000', '3500000.0000', '3500000.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(10) NOT NULL,
  `version` varchar(10) NOT NULL,
  `is_update_available` tinyint(1) NOT NULL DEFAULT 0,
  `update_version` varchar(100) DEFAULT NULL,
  `update_link` text CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `version`, `is_update_available`, `update_version`, `update_link`, `created_at`, `updated_at`) VALUES
(1, '2.0', 0, NULL, NULL, '2018-09-14 18:00:00', '2018-09-14 14:20:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sms_schedule`
--

CREATE TABLE `sms_schedule` (
  `id` int(11) UNSIGNED NOT NULL,
  `schedule_datetime` timestamp NULL DEFAULT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `people_type` varchar(100) DEFAULT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `people_name` varchar(100) NOT NULL,
  `sms_text` text NOT NULL,
  `sms_type` varchar(50) NOT NULL DEFAULT 'TEXT',
  `campaign_name` varchar(100) DEFAULT NULL,
  `process_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `response_text` varchar(250) DEFAULT NULL,
  `delivery_status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sms_setting`
--

CREATE TABLE `sms_setting` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `api_id` varchar(100) DEFAULT NULL,
  `auth_key` varchar(100) DEFAULT NULL,
  `sender_id` varchar(100) NOT NULL,
  `contact` text DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `maskname` varchar(100) DEFAULT NULL,
  `campaignname` varchar(100) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `sms_setting`
--

INSERT INTO `sms_setting` (`id`, `type`, `api_id`, `auth_key`, `sender_id`, `contact`, `username`, `password`, `maskname`, `campaignname`, `url`, `status`, `sort_order`, `created_at`, `updated_at`) VALUES
(2, 'Clickatell', '', NULL, '', NULL, '', '', NULL, NULL, NULL, 1, 0, NULL, '2020-07-09 07:04:31'),
(3, 'Twilio', '', NULL, '', NULL, '', '', NULL, NULL, NULL, 1, 0, NULL, '2020-07-09 07:04:31'),
(4, 'Msg91', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2020-07-09 07:04:31'),
(5, 'ITS24', 'dGhpbms6QXNpZi40MzQz', NULL, 'think', NULL, NULL, NULL, NULL, NULL, 'https://sms.one9.one/sms/api', 1, 0, NULL, '2020-07-09 07:04:31'),
(6, 'Onnorokomsms', NULL, NULL, '', NULL, '', '', '', '', 'https://api2.onnorokomsms.com/HttpSendSms.ashx?', 1, 0, NULL, '2020-07-09 07:04:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stores`
--

CREATE TABLE `stores` (
  `store_id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(14) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip_code` varchar(50) NOT NULL,
  `currency` varchar(100) NOT NULL DEFAULT 'USD',
  `vat_reg_no` varchar(250) DEFAULT NULL,
  `cashier_id` int(10) UNSIGNED NOT NULL,
  `address` longtext NOT NULL,
  `receipt_printer` varchar(100) DEFAULT NULL,
  `cash_drawer_codes` varchar(100) DEFAULT NULL,
  `char_per_line` tinyint(4) NOT NULL DEFAULT 42,
  `remote_printing` tinyint(1) NOT NULL DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(100) DEFAULT NULL,
  `auto_print` tinyint(1) NOT NULL DEFAULT 0,
  `local_printers` tinyint(1) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `favicon` varchar(250) DEFAULT NULL,
  `preference` longtext DEFAULT NULL,
  `sound_effect` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `feedback_status` varchar(100) NOT NULL DEFAULT 'ready',
  `feedback_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `stores`
--

INSERT INTO `stores` (`store_id`, `name`, `mobile`, `country`, `zip_code`, `currency`, `vat_reg_no`, `cashier_id`, `address`, `receipt_printer`, `cash_drawer_codes`, `char_per_line`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `logo`, `favicon`, `preference`, `sound_effect`, `sort_order`, `feedback_status`, `feedback_at`, `status`, `created_at`) VALUES
(1, 'Mang Aduy Laundry', '000000', 'ID', '1200', 'IDR', '987654321', 2, 'Jakarta', '1', 'x1C', 42, 0, 1, '[\"1\",\"2\"]', 0, 1, '1_logo.png', '1_favicon.png', 'a:29:{s:10:\"gst_reg_no\";s:0:\"\";s:8:\"timezone\";s:12:\"Asia/Jakarta\";s:21:\"invoice_edit_lifespan\";s:4:\"1440\";s:26:\"invoice_edit_lifespan_unit\";s:6:\"minute\";s:23:\"invoice_delete_lifespan\";s:4:\"1440\";s:28:\"invoice_delete_lifespan_unit\";s:6:\"minute\";s:3:\"tax\";s:1:\"0\";s:11:\"sms_gateway\";s:10:\"Clickatell\";s:9:\"sms_alert\";s:1:\"0\";s:20:\"datatable_item_limit\";s:2:\"25\";s:14:\"invoice_prefix\";s:0:\"\";s:12:\"invoice_view\";s:8:\"standard\";s:14:\"business_state\";s:2:\"AN\";s:31:\"change_item_price_while_billing\";s:1:\"0\";s:25:\"pos_product_display_limit\";s:0:\"\";s:15:\"after_sell_page\";s:3:\"pos\";s:19:\"invoice_footer_text\";s:26:\"Thank you for choosing us!\";s:10:\"email_from\";s:11:\"Kadal  Mart\";s:13:\"email_address\";s:2:\"ID\";s:12:\"email_driver\";s:11:\"smtp_server\";s:14:\"send_mail_path\";s:18:\"/usr/sbin/sendmail\";s:9:\"smtp_host\";s:15:\"smtp.google.com\";s:13:\"smtp_username\";s:23:\"rezzabagus.rb@gmail.com\";s:13:\"smtp_password\";s:19:\"kapansajadimanasaja\";s:9:\"smtp_port\";s:3:\"465\";s:7:\"ssl_tls\";s:3:\"ssl\";s:12:\"ftp_hostname\";s:0:\"\";s:12:\"ftp_username\";s:0:\"\";s:12:\"ftp_password\";s:0:\"\";}', 1, 0, 'ready', '2018-12-22 12:29:05', 1, '2018-09-24 18:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `sup_id` int(10) UNSIGNED NOT NULL,
  `sup_name` varchar(100) NOT NULL,
  `sup_mobile` varchar(14) DEFAULT NULL,
  `sup_email` varchar(100) DEFAULT NULL,
  `sup_address` text DEFAULT NULL,
  `sup_city` varchar(100) DEFAULT NULL,
  `sup_state` varchar(55) DEFAULT NULL,
  `sup_country` varchar(100) DEFAULT NULL,
  `sup_details` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`sup_id`, `sup_name`, `sup_mobile`, `sup_email`, `sup_address`, `sup_city`, `sup_state`, `sup_country`, `sup_details`, `created_at`) VALUES
(9, 'Default supplier', '11111111111111', 'default@default.com', 'Address', 'City', 'AN', 'AD', '', '2019-02-11 16:55:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier_to_store`
--

CREATE TABLE `supplier_to_store` (
  `s2s_id` int(10) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `balance` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `supplier_to_store`
--

INSERT INTO `supplier_to_store` (`s2s_id`, `sup_id`, `store_id`, `balance`, `status`, `sort_order`) VALUES
(20, 9, 1, '0.0000', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier_transactions`
--

CREATE TABLE `supplier_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `sup_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(55) DEFAULT NULL,
  `ref_invoice_id` varchar(55) DEFAULT NULL,
  `type` varchar(55) NOT NULL,
  `pmethod_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `amount` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `store_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier_transactions`
--

INSERT INTO `supplier_transactions` (`id`, `sup_id`, `reference_no`, `ref_invoice_id`, `type`, `pmethod_id`, `description`, `amount`, `store_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 9, 'CT200710100001', '001', 'purchase', 0, 'Paid while purchasing', '100000000.0000', 1, 1, '2020-07-10 04:19:00', '2020-07-10 04:20:18'),
(2, 10, 'CT2008011002', '15651651', 'purchase', 0, 'Paid while purchasing', '3000000.0000', 1, 1, '2020-08-01 01:48:00', '2020-08-01 01:49:55'),
(3, 10, 'CT20080111003', '159', 'purchase', 0, 'Paid while purchasing', '5000000.0000', 1, 1, '2020-08-01 03:34:00', '2020-08-01 03:35:39'),
(4, 10, 'CT20080111004', '789456123', 'purchase', 0, 'Paid while purchasing', '6000000.0000', 1, 1, '2020-08-01 03:36:00', '2020-08-01 03:37:14'),
(5, 9, 'CT20080111005', '456456', 'purchase', 0, 'Paid while purchasing', '150000000.0000', 1, 1, '2020-08-01 01:27:00', '2020-08-01 13:28:50'),
(6, 9, 'CT20080111006', '123456', 'purchase', 0, 'Paid while purchasing', '150000000.0000', 1, 1, '2020-08-01 01:39:00', '2020-08-01 13:39:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sync`
--

CREATE TABLE `sync` (
  `id` int(10) NOT NULL,
  `sql_statement` longtext NOT NULL,
  `sql_args` longtext NOT NULL,
  `created_by` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `taxrates`
--

CREATE TABLE `taxrates` (
  `taxrate_id` int(11) NOT NULL,
  `taxrate_name` varchar(55) CHARACTER SET utf8 NOT NULL,
  `taxrate_code` varchar(55) CHARACTER SET utf8 DEFAULT NULL,
  `taxrate` decimal(25,4) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `taxrates`
--

INSERT INTO `taxrates` (`taxrate_id`, `taxrate_name`, `taxrate_code`, `taxrate`, `status`, `sort_order`) VALUES
(1, 'GST @0%', 'GG0', '0.0000', 1, 0),
(2, 'GST @18%', 'GGX', '18.0000', 1, 0),
(3, 'No Tax', 'NNX', '0.0000', 1, 0),
(4, 'VAT @10%', 'VVX', '10.0000', 1, 0),
(5, 'Tax @20%', 'TTX', '20.0000', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfers`
--

CREATE TABLE `transfers` (
  `id` int(11) NOT NULL,
  `ref_no` varchar(55) NOT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `from_store_id` int(11) NOT NULL,
  `to_store_id` int(11) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total_item` int(10) DEFAULT NULL,
  `total_quantity` int(10) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `attachment` varchar(55) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transfer_items`
--

CREATE TABLE `transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `units`
--

CREATE TABLE `units` (
  `unit_id` int(10) NOT NULL,
  `unit_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `unit_details` text CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `units`
--

INSERT INTO `units` (`unit_id`, `unit_name`, `unit_details`) VALUES
(2, 'kg', ''),
(9, 'gram', ''),
(10, 'Pcs', 'Pieces'),
(11, 'Plate', ''),
(12, 'box', 'box unit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `unit_to_store`
--

CREATE TABLE `unit_to_store` (
  `unit2s_id` int(10) UNSIGNED NOT NULL,
  `uunit_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `store_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `unit_to_store`
--

INSERT INTO `unit_to_store` (`unit2s_id`, `uunit_id`, `store_id`, `status`, `sort_order`) VALUES
(2, 2, 1, 1, 0),
(8, 9, 1, 1, 2),
(10, 10, 1, 1, 0),
(12, 11, 1, 1, 0),
(15, 12, 1, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `raw_password` varchar(100) DEFAULT NULL,
  `pass_reset_code` varchar(32) DEFAULT NULL,
  `reset_code_time` timestamp NULL DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `preference` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `group_id`, `username`, `email`, `mobile`, `password`, `raw_password`, `pass_reset_code`, `reset_code_time`, `ip`, `preference`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kadal', 'rezzabagus.rb@gmail.com', '088210618549', 'e693f45ab1f8075c7a7328137f7b3430', 'kapansajadimanasaja', '', '0000-00-00 00:00:00', '::1', 'a:4:{s:8:\"language\";s:6:\"bahasa\";s:10:\"base_color\";s:5:\"green\";s:14:\"pos_side_panel\";s:5:\"right\";s:11:\"pos_pattern\";s:27:\"blank-close-up-crumpled.jpg\";}', '2020-07-08 17:34:34', '2020-07-31 03:55:53'),
(2, 2, 'Cashier', 'cashier@admin.com', '0113743723456', '25f9e794323b453885f5181f1b624d0b', '123456789', '', '0000-00-00 00:00:00', '::1', 'a:4:{s:8:\"language\";s:7:\"english\";s:10:\"base_color\";s:5:\"green\";s:14:\"pos_side_panel\";s:5:\"right\";s:11:\"pos_pattern\";s:13:\"brickwall.jpg\";}', '2020-07-08 17:34:34', '2020-07-09 07:04:31'),
(3, 3, 'Salesman', 'salesman@admin.com', '0113743700', '25f9e794323b453885f5181f1b624d0b', '123456789', '', '0000-00-00 00:00:00', '::1', 'a:4:{s:8:\"language\";s:7:\"english\";s:10:\"base_color\";s:5:\"black\";s:14:\"pos_side_panel\";s:4:\"left\";s:11:\"pos_pattern\";s:13:\"brickwall.jpg\";}', '2020-07-08 17:34:34', '2020-07-09 07:04:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_group`
--

CREATE TABLE `user_group` (
  `group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `sort_order` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_group`
--

INSERT INTO `user_group` (`group_id`, `name`, `slug`, `sort_order`, `status`, `permission`) VALUES
(1, 'Admin', 'admin', 1, 1, 'a:1:{s:6:\"access\";a:146:{s:16:\"read_sell_report\";s:4:\"true\";s:22:\"read_accounting_report\";s:4:\"true\";s:20:\"read_overview_report\";s:4:\"true\";s:22:\"read_collection_report\";s:4:\"true\";s:27:\"read_full_collection_report\";s:4:\"true\";s:35:\"read_customer_due_collection_report\";s:4:\"true\";s:29:\"read_supplier_due_paid_report\";s:4:\"true\";s:14:\"read_analytics\";s:4:\"true\";s:21:\"send_report_via_email\";s:4:\"true\";s:19:\"read_summary_report\";s:4:\"true\";s:15:\"read_buy_report\";s:4:\"true\";s:23:\"read_buy_payment_report\";s:4:\"true\";s:24:\"read_sell_payment_report\";s:4:\"true\";s:20:\"read_sell_tax_report\";s:4:\"true\";s:19:\"read_buy_tax_report\";s:4:\"true\";s:24:\"read_tax_overview_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:17:\"send_report_email\";s:4:\"true\";s:8:\"withdraw\";s:4:\"true\";s:7:\"deposit\";s:4:\"true\";s:8:\"transfer\";s:4:\"true\";s:19:\"create_bank_account\";s:4:\"true\";s:19:\"update_bank_account\";s:4:\"true\";s:19:\"delete_bank_account\";s:4:\"true\";s:17:\"read_bank_account\";s:4:\"true\";s:23:\"read_bank_account_sheet\";s:4:\"true\";s:18:\"read_bank_transfer\";s:4:\"true\";s:22:\"read_bank_transactions\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:23:\"delete_purchase_invoice\";s:4:\"true\";s:16:\"purchase_payment\";s:4:\"true\";s:15:\"purchase_return\";s:4:\"true\";s:20:\"read_buy_transaction\";s:4:\"true\";s:21:\"read_sell_transaction\";s:4:\"true\";s:14:\"create_invoice\";s:4:\"true\";s:17:\"read_invoice_list\";s:4:\"true\";s:12:\"view_invoice\";s:4:\"true\";s:11:\"return_item\";s:4:\"true\";s:13:\"email_invoice\";s:4:\"true\";s:19:\"update_invoice_info\";s:4:\"true\";s:14:\"delete_invoice\";s:4:\"true\";s:11:\"sell_return\";s:4:\"true\";s:7:\"payment\";s:4:\"true\";s:10:\"create_due\";s:4:\"true\";s:13:\"read_transfer\";s:4:\"true\";s:12:\"add_transfer\";s:4:\"true\";s:15:\"update_transfer\";s:4:\"true\";s:13:\"read_giftcard\";s:4:\"true\";s:12:\"add_giftcard\";s:4:\"true\";s:15:\"update_giftcard\";s:4:\"true\";s:15:\"delete_giftcard\";s:4:\"true\";s:14:\"giftcard_topup\";s:4:\"true\";s:19:\"read_giftcard_topup\";s:4:\"true\";s:21:\"delete_giftcard_topup\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:19:\"product_bulk_action\";s:4:\"true\";s:18:\"delete_all_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:15:\"delete_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"print_barcode\";s:4:\"true\";s:19:\"restore_all_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:8:\"read_box\";s:4:\"true\";s:10:\"create_box\";s:4:\"true\";s:10:\"update_box\";s:4:\"true\";s:10:\"delete_box\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:11:\"create_unit\";s:4:\"true\";s:11:\"update_unit\";s:4:\"true\";s:11:\"delete_unit\";s:4:\"true\";s:12:\"read_taxrate\";s:4:\"true\";s:14:\"create_taxrate\";s:4:\"true\";s:14:\"update_taxrate\";s:4:\"true\";s:14:\"delete_taxrate\";s:4:\"true\";s:12:\"read_expense\";s:4:\"true\";s:14:\"create_expense\";s:4:\"true\";s:14:\"update_expense\";s:4:\"true\";s:14:\"delete_expense\";s:4:\"true\";s:9:\"read_loan\";s:4:\"true\";s:17:\"read_loan_summary\";s:4:\"true\";s:9:\"take_loan\";s:4:\"true\";s:11:\"update_loan\";s:4:\"true\";s:11:\"delete_loan\";s:4:\"true\";s:8:\"loan_pay\";s:4:\"true\";s:13:\"read_customer\";s:4:\"true\";s:21:\"read_customer_profile\";s:4:\"true\";s:15:\"create_customer\";s:4:\"true\";s:15:\"update_customer\";s:4:\"true\";s:15:\"delete_customer\";s:4:\"true\";s:9:\"read_user\";s:4:\"true\";s:11:\"create_user\";s:4:\"true\";s:11:\"update_user\";s:4:\"true\";s:11:\"delete_user\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:14:\"read_usergroup\";s:4:\"true\";s:16:\"create_usergroup\";s:4:\"true\";s:16:\"update_usergroup\";s:4:\"true\";s:16:\"delete_usergroup\";s:4:\"true\";s:13:\"read_currency\";s:4:\"true\";s:15:\"create_currency\";s:4:\"true\";s:15:\"update_currency\";s:4:\"true\";s:15:\"change_currency\";s:4:\"true\";s:15:\"delete_currency\";s:4:\"true\";s:16:\"read_filemanager\";s:4:\"true\";s:12:\"read_pmethod\";s:4:\"true\";s:14:\"create_pmethod\";s:4:\"true\";s:14:\"update_pmethod\";s:4:\"true\";s:14:\"delete_pmethod\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";s:12:\"create_store\";s:4:\"true\";s:12:\"update_store\";s:4:\"true\";s:12:\"delete_store\";s:4:\"true\";s:14:\"activate_store\";s:4:\"true\";s:14:\"upload_favicon\";s:4:\"true\";s:11:\"upload_logo\";s:4:\"true\";s:12:\"read_printer\";s:4:\"true\";s:14:\"create_printer\";s:4:\"true\";s:14:\"update_printer\";s:4:\"true\";s:14:\"delete_printer\";s:4:\"true\";s:16:\"read_sms_setting\";s:4:\"true\";s:18:\"update_sms_setting\";s:4:\"true\";s:8:\"send_sms\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:22:\"read_keyboard_shortcut\";s:4:\"true\";s:13:\"language_sync\";s:4:\"true\";s:6:\"backup\";s:4:\"true\";s:7:\"restore\";s:4:\"true\";s:14:\"show_buy_price\";s:4:\"true\";s:11:\"show_profit\";s:4:\"true\";s:10:\"show_graph\";s:4:\"true\";}}'),
(2, 'Cashier', 'cashier', 2, 1, 'a:1:{s:6:\"access\";a:136:{s:16:\"read_sell_report\";s:4:\"true\";s:22:\"read_accounting_report\";s:4:\"true\";s:20:\"read_overview_report\";s:4:\"true\";s:22:\"read_collection_report\";s:4:\"true\";s:27:\"read_full_collection_report\";s:4:\"true\";s:35:\"read_customer_due_collection_report\";s:4:\"true\";s:29:\"read_supplier_due_paid_report\";s:4:\"true\";s:14:\"read_analytics\";s:4:\"true\";s:21:\"send_report_via_email\";s:4:\"true\";s:15:\"read_buy_report\";s:4:\"true\";s:23:\"read_buy_payment_report\";s:4:\"true\";s:24:\"read_sell_payment_report\";s:4:\"true\";s:20:\"read_sell_tax_report\";s:4:\"true\";s:19:\"read_buy_tax_report\";s:4:\"true\";s:17:\"read_stock_report\";s:4:\"true\";s:17:\"send_report_email\";s:4:\"true\";s:8:\"withdraw\";s:4:\"true\";s:7:\"deposit\";s:4:\"true\";s:8:\"transfer\";s:4:\"true\";s:19:\"create_bank_account\";s:4:\"true\";s:19:\"update_bank_account\";s:4:\"true\";s:19:\"delete_bank_account\";s:4:\"true\";s:17:\"read_bank_account\";s:4:\"true\";s:23:\"read_bank_account_sheet\";s:4:\"true\";s:18:\"read_bank_transfer\";s:4:\"true\";s:22:\"read_bank_transactions\";s:4:\"true\";s:18:\"read_purchase_list\";s:4:\"true\";s:23:\"create_purchase_invoice\";s:4:\"true\";s:28:\"update_purchase_invoice_info\";s:4:\"true\";s:23:\"delete_purchase_invoice\";s:4:\"true\";s:16:\"purchase_payment\";s:4:\"true\";s:15:\"purchase_return\";s:4:\"true\";s:14:\"create_invoice\";s:4:\"true\";s:17:\"read_invoice_list\";s:4:\"true\";s:12:\"view_invoice\";s:4:\"true\";s:11:\"return_item\";s:4:\"true\";s:13:\"email_invoice\";s:4:\"true\";s:19:\"update_invoice_info\";s:4:\"true\";s:14:\"delete_invoice\";s:4:\"true\";s:11:\"sell_return\";s:4:\"true\";s:7:\"payment\";s:4:\"true\";s:10:\"create_due\";s:4:\"true\";s:13:\"read_transfer\";s:4:\"true\";s:12:\"add_transfer\";s:4:\"true\";s:15:\"update_transfer\";s:4:\"true\";s:13:\"read_giftcard\";s:4:\"true\";s:12:\"add_giftcard\";s:4:\"true\";s:15:\"update_giftcard\";s:4:\"true\";s:15:\"delete_giftcard\";s:4:\"true\";s:14:\"giftcard_topup\";s:4:\"true\";s:19:\"read_giftcard_topup\";s:4:\"true\";s:21:\"delete_giftcard_topup\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:14:\"create_product\";s:4:\"true\";s:14:\"update_product\";s:4:\"true\";s:14:\"delete_product\";s:4:\"true\";s:14:\"import_product\";s:4:\"true\";s:19:\"product_bulk_action\";s:4:\"true\";s:18:\"delete_all_product\";s:4:\"true\";s:13:\"read_category\";s:4:\"true\";s:15:\"create_category\";s:4:\"true\";s:15:\"update_category\";s:4:\"true\";s:15:\"delete_category\";s:4:\"true\";s:16:\"read_stock_alert\";s:4:\"true\";s:20:\"read_expired_product\";s:4:\"true\";s:13:\"print_barcode\";s:4:\"true\";s:19:\"restore_all_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:15:\"create_supplier\";s:4:\"true\";s:15:\"update_supplier\";s:4:\"true\";s:15:\"delete_supplier\";s:4:\"true\";s:21:\"read_supplier_profile\";s:4:\"true\";s:8:\"read_box\";s:4:\"true\";s:10:\"create_box\";s:4:\"true\";s:10:\"update_box\";s:4:\"true\";s:10:\"delete_box\";s:4:\"true\";s:9:\"read_unit\";s:4:\"true\";s:11:\"create_unit\";s:4:\"true\";s:11:\"update_unit\";s:4:\"true\";s:11:\"delete_unit\";s:4:\"true\";s:12:\"read_taxrate\";s:4:\"true\";s:14:\"create_taxrate\";s:4:\"true\";s:14:\"update_taxrate\";s:4:\"true\";s:14:\"delete_taxrate\";s:4:\"true\";s:12:\"read_expense\";s:4:\"true\";s:14:\"create_expense\";s:4:\"true\";s:14:\"update_expense\";s:4:\"true\";s:14:\"delete_expense\";s:4:\"true\";s:9:\"read_loan\";s:4:\"true\";s:17:\"read_loan_summary\";s:4:\"true\";s:9:\"take_loan\";s:4:\"true\";s:11:\"update_loan\";s:4:\"true\";s:11:\"delete_loan\";s:4:\"true\";s:13:\"read_customer\";s:4:\"true\";s:21:\"read_customer_profile\";s:4:\"true\";s:15:\"create_customer\";s:4:\"true\";s:15:\"update_customer\";s:4:\"true\";s:15:\"delete_customer\";s:4:\"true\";s:9:\"read_user\";s:4:\"true\";s:11:\"create_user\";s:4:\"true\";s:11:\"update_user\";s:4:\"true\";s:11:\"delete_user\";s:4:\"true\";s:15:\"change_password\";s:4:\"true\";s:14:\"read_usergroup\";s:4:\"true\";s:16:\"create_usergroup\";s:4:\"true\";s:16:\"update_usergroup\";s:4:\"true\";s:16:\"delete_usergroup\";s:4:\"true\";s:13:\"read_currency\";s:4:\"true\";s:15:\"create_currency\";s:4:\"true\";s:15:\"update_currency\";s:4:\"true\";s:15:\"change_currency\";s:4:\"true\";s:15:\"delete_currency\";s:4:\"true\";s:16:\"read_filemanager\";s:4:\"true\";s:10:\"read_store\";s:4:\"true\";s:12:\"create_store\";s:4:\"true\";s:12:\"update_store\";s:4:\"true\";s:12:\"delete_store\";s:4:\"true\";s:14:\"activate_store\";s:4:\"true\";s:14:\"upload_favicon\";s:4:\"true\";s:11:\"upload_logo\";s:4:\"true\";s:12:\"read_printer\";s:4:\"true\";s:14:\"create_printer\";s:4:\"true\";s:14:\"update_printer\";s:4:\"true\";s:14:\"delete_printer\";s:4:\"true\";s:16:\"read_sms_setting\";s:4:\"true\";s:18:\"update_sms_setting\";s:4:\"true\";s:8:\"send_sms\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:22:\"read_keyboard_shortcut\";s:4:\"true\";s:6:\"backup\";s:4:\"true\";s:7:\"restore\";s:4:\"true\";s:14:\"show_buy_price\";s:4:\"true\";s:11:\"show_profit\";s:4:\"true\";s:10:\"show_graph\";s:4:\"true\";}}'),
(3, 'Salesman', 'salesman', 3, 1, 'a:1:{s:6:\"access\";a:28:{s:22:\"read_accounting_report\";s:4:\"true\";s:8:\"withdraw\";s:4:\"true\";s:7:\"deposit\";s:4:\"true\";s:8:\"transfer\";s:4:\"true\";s:19:\"create_bank_account\";s:4:\"true\";s:19:\"update_bank_account\";s:4:\"true\";s:19:\"delete_bank_account\";s:4:\"true\";s:17:\"read_bank_account\";s:4:\"true\";s:23:\"read_bank_account_sheet\";s:4:\"true\";s:18:\"read_bank_transfer\";s:4:\"true\";s:22:\"read_bank_transactions\";s:4:\"true\";s:14:\"create_invoice\";s:4:\"true\";s:17:\"read_invoice_list\";s:4:\"true\";s:12:\"view_invoice\";s:4:\"true\";s:19:\"add_item_to_invoice\";s:4:\"true\";s:24:\"remove_item_from_invoice\";s:4:\"true\";s:14:\"delete_invoice\";s:4:\"true\";s:13:\"email_invoice\";s:4:\"true\";s:10:\"create_due\";s:4:\"true\";s:14:\"due_collection\";s:4:\"true\";s:12:\"read_product\";s:4:\"true\";s:13:\"read_supplier\";s:4:\"true\";s:8:\"read_box\";s:4:\"true\";s:19:\"read_payment_method\";s:4:\"true\";s:20:\"read_user_preference\";s:4:\"true\";s:22:\"update_user_preference\";s:4:\"true\";s:9:\"filtering\";s:4:\"true\";s:22:\"read_keyboard_shortcut\";s:4:\"true\";}}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_to_store`
--

CREATE TABLE `user_to_store` (
  `u2s_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_to_store`
--

INSERT INTO `user_to_store` (`u2s_id`, `user_id`, `store_id`, `status`, `sort_order`) VALUES
(1, 2, 1, 1, 0),
(2, 3, 1, 1, 2),
(4, 1, 1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bank_account_to_store`
--
ALTER TABLE `bank_account_to_store`
  ADD PRIMARY KEY (`ba2s`);

--
-- Indeks untuk tabel `bank_transaction_info`
--
ALTER TABLE `bank_transaction_info`
  ADD PRIMARY KEY (`info_id`),
  ADD UNIQUE KEY `bank_transaction_id` (`ref_no`);

--
-- Indeks untuk tabel `bank_transaction_price`
--
ALTER TABLE `bank_transaction_price`
  ADD PRIMARY KEY (`price_id`);

--
-- Indeks untuk tabel `boxes`
--
ALTER TABLE `boxes`
  ADD PRIMARY KEY (`box_id`);

--
-- Indeks untuk tabel `box_to_store`
--
ALTER TABLE `box_to_store`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `buying_info`
--
ALTER TABLE `buying_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indeks untuk tabel `buying_item`
--
ALTER TABLE `buying_item`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `buying_payments`
--
ALTER TABLE `buying_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `buying_price`
--
ALTER TABLE `buying_price`
  ADD PRIMARY KEY (`price_id`);

--
-- Indeks untuk tabel `buying_returns`
--
ALTER TABLE `buying_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `buying_return_items`
--
ALTER TABLE `buying_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `category_to_store`
--
ALTER TABLE `category_to_store`
  ADD PRIMARY KEY (`c2s_id`);

--
-- Indeks untuk tabel `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indeks untuk tabel `currency_to_store`
--
ALTER TABLE `currency_to_store`
  ADD PRIMARY KEY (`ca2s_id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `customer_to_store`
--
ALTER TABLE `customer_to_store`
  ADD PRIMARY KEY (`c2s_id`);

--
-- Indeks untuk tabel `customer_transactions`
--
ALTER TABLE `customer_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `expense_categorys`
--
ALTER TABLE `expense_categorys`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indeks untuk tabel `gift_card_topups`
--
ALTER TABLE `gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indeks untuk tabel `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indeks untuk tabel `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `loan_to_store`
--
ALTER TABLE `loan_to_store`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pmethods`
--
ALTER TABLE `pmethods`
  ADD PRIMARY KEY (`pmethod_id`);

--
-- Indeks untuk tabel `pmethod_to_store`
--
ALTER TABLE `pmethod_to_store`
  ADD PRIMARY KEY (`p2s_id`);

--
-- Indeks untuk tabel `pos_receipt_template`
--
ALTER TABLE `pos_receipt_template`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`printer_id`);

--
-- Indeks untuk tabel `printer_to_store`
--
ALTER TABLE `printer_to_store`
  ADD PRIMARY KEY (`p2s_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`),
  ADD UNIQUE KEY `p_code` (`p_code`) USING BTREE;

--
-- Indeks untuk tabel `product_to_store`
--
ALTER TABLE `product_to_store`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `return_items`
--
ALTER TABLE `return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `selling_info`
--
ALTER TABLE `selling_info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indeks untuk tabel `selling_item`
--
ALTER TABLE `selling_item`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `selling_price`
--
ALTER TABLE `selling_price`
  ADD PRIMARY KEY (`price_id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sms_schedule`
--
ALTER TABLE `sms_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sms_setting`
--
ALTER TABLE `sms_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indeks untuk tabel `supplier_to_store`
--
ALTER TABLE `supplier_to_store`
  ADD PRIMARY KEY (`s2s_id`);

--
-- Indeks untuk tabel `supplier_transactions`
--
ALTER TABLE `supplier_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sync`
--
ALTER TABLE `sync`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `taxrates`
--
ALTER TABLE `taxrates`
  ADD PRIMARY KEY (`taxrate_id`);

--
-- Indeks untuk tabel `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indeks untuk tabel `transfer_items`
--
ALTER TABLE `transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indeks untuk tabel `unit_to_store`
--
ALTER TABLE `unit_to_store`
  ADD PRIMARY KEY (`unit2s_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `user_to_store`
--
ALTER TABLE `user_to_store`
  ADD PRIMARY KEY (`u2s_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank_account_to_store`
--
ALTER TABLE `bank_account_to_store`
  MODIFY `ba2s` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank_transaction_info`
--
ALTER TABLE `bank_transaction_info`
  MODIFY `info_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `bank_transaction_price`
--
ALTER TABLE `bank_transaction_price`
  MODIFY `price_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `boxes`
--
ALTER TABLE `boxes`
  MODIFY `box_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `box_to_store`
--
ALTER TABLE `box_to_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `buying_info`
--
ALTER TABLE `buying_info`
  MODIFY `info_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `buying_item`
--
ALTER TABLE `buying_item`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `buying_payments`
--
ALTER TABLE `buying_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `buying_price`
--
ALTER TABLE `buying_price`
  MODIFY `price_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `buying_returns`
--
ALTER TABLE `buying_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `buying_return_items`
--
ALTER TABLE `buying_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categorys`
--
ALTER TABLE `categorys`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `category_to_store`
--
ALTER TABLE `category_to_store`
  MODIFY `c2s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `currency_to_store`
--
ALTER TABLE `currency_to_store`
  MODIFY `ca2s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `customer_to_store`
--
ALTER TABLE `customer_to_store`
  MODIFY `c2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `customer_transactions`
--
ALTER TABLE `customer_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expense_categorys`
--
ALTER TABLE `expense_categorys`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `gift_card_topups`
--
ALTER TABLE `gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `loans`
--
ALTER TABLE `loans`
  MODIFY `loan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `loan_to_store`
--
ALTER TABLE `loan_to_store`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `pmethods`
--
ALTER TABLE `pmethods`
  MODIFY `pmethod_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pmethod_to_store`
--
ALTER TABLE `pmethod_to_store`
  MODIFY `p2s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `pos_receipt_template`
--
ALTER TABLE `pos_receipt_template`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `printers`
--
ALTER TABLE `printers`
  MODIFY `printer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `printer_to_store`
--
ALTER TABLE `printer_to_store`
  MODIFY `p2s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `p_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT untuk tabel `product_to_store`
--
ALTER TABLE `product_to_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT untuk tabel `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `return_items`
--
ALTER TABLE `return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `selling_info`
--
ALTER TABLE `selling_info`
  MODIFY `info_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `selling_item`
--
ALTER TABLE `selling_item`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `selling_price`
--
ALTER TABLE `selling_price`
  MODIFY `price_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `sms_schedule`
--
ALTER TABLE `sms_schedule`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT untuk tabel `sms_setting`
--
ALTER TABLE `sms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `supplier_to_store`
--
ALTER TABLE `supplier_to_store`
  MODIFY `s2s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `supplier_transactions`
--
ALTER TABLE `supplier_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `sync`
--
ALTER TABLE `sync`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `taxrates`
--
ALTER TABLE `taxrates`
  MODIFY `taxrate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transfer_items`
--
ALTER TABLE `transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `unit_to_store`
--
ALTER TABLE `unit_to_store`
  MODIFY `unit2s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_group`
--
ALTER TABLE `user_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user_to_store`
--
ALTER TABLE `user_to_store`
  MODIFY `u2s_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
