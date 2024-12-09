<?php
session_start();  // Pastikan session sudah dimulai

// Koneksi ke database
include '../../controller/config.php';  // Sesuaikan dengan path file database.php

// Cek apakah pengguna sudah login
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header("Location: ../../landing-page.php");
    exit();
}

// Ambil data user_id dari session
$user_id = $_SESSION['user_id'];  // Pastikan 'user_id' ada dalam session setelah login

// Query untuk mengambil data produk marketplace berdasarkan user_id
$sql = "SELECT * FROM marketplace WHERE user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);  // Bind parameter untuk user_id
$stmt->execute();
$result = $stmt->get_result();

// Mengecek apakah ada produk
if ($result->num_rows > 0) {
    // Ambil produk pertama
    $row = $result->fetch_assoc();
} else {
    // Jika tidak ada produk, set $row ke array kosong
    $row = null;
}
// Query to get the user's phone number from the user table
$sql_user = "SELECT user_phone_number FROM users WHERE user_id = ?";
$stmt_user = $conn->prepare($sql_user);
$stmt_user->bind_param("i", $user_id);  // Bind user_id
$stmt_user->execute();
$result_user = $stmt_user->get_result();

// Fetch the phone number
if ($result_user->num_rows > 0) {
    $user_data = $result_user->fetch_assoc();
    $phone_number = $user_data['user_phone_number'];
} else {
    $phone_number = null;
}

$stmt_user->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en" class="bg-light dark:bg-gray-800">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../../css/styles.css" rel="stylesheet">
    <title>Lestari - Marketplace</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
          theme: {
            extend: {
              fontFamily: {
                'poppins': ['Poppins', 'sans-serif']
              },
              colors: {
                'green': '#1B5E20',
                'dark-green': '#2E7D32'
              }
            }
          }
        }
    </script>
    <script>
        function toggleModal() {
            const modal = document.getElementById("location-modal");
            modal.classList.toggle("hidden");
        }
    </script>
</head>
<body class="font-poppins bg-light">

<!-- NAVBAR -->
<div class="navbar bg-light h-20 pr-10 justify-between sticky top-0 z-50">
   <!-- MOBILE SCREEN MODE -->
   <div class="navbar-start pl-1/2">
        <div class="dropdown">
            <div tabindex="0" role="button" class="btn btn-ghost lg:hidden" id="hamburger-btn">
            <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-5 w-5"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor">
                <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M4 6h16M4 12h8m-8 6h16" />
            </svg>
            </div>
            <ul
            id="dropdown-menu"
            class="menu menu-sm dropdown-content bg-white rounded-box z-[1] mt-3 w-52 p-2 shadow hidden">
            <li><a href="../../landing-page.php">Home</a></li>
            <li><a href="../../user/tentang.php">Tentang kami</a></li>
            <li>
              <a>Layanan</a>
              <ul class="p-2">
                <!-- Drop Off -->
                <li>
                    <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
                    <button onclick="window.location.href='../../user/drop-off/dropoff.php'" >
                        <p>Drop Off</p>
                    </button>
                    <?php else: ?>
                    <button onclick="showModal()" >
                        <p>Drop Off</p>
                    </button>
                    <?php endif; ?>
                </li>
                 <!-- Rewards -->
                <li>
                    <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
                    <button onclick="window.location.href='../../user/drop-off/poin.php'" >
                        <p>Rewards</p>
                    </button>
                    <?php else: ?>
                    <button onclick="showModal()" >
                        <p>Rewards</p>
                    </button>
                    <?php endif; ?>
                </li>
                
                <!-- Marketplace -->
                <li>
                    <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
                    <button onclick="window.location.href='../../user/marketplace/marketplace.php'">
                        <p>Marketplace</p>
                    </button>
                    <?php else: ?>
                    <button onclick="showModal()" >
                        <p>Marketplace</p>
                    </button>
                    <?php endif; ?>
                </li>
                    </ul>
                </li>
            <li><a href="../../user/blog.php">Blog</a></li>
            <li><a href="../../user/kontak-kami.php">Kontak Kami</a></li>
          </ul>
        </div>
        <!-- BRAND LOGO -->
        <a href="../../landing-page.php" class="">
          <img src="../../images/Logo.png" alt="Logo Lestari">
        </a>
      </div>
<!-- DESKTOP MODE -->
<div class="navbar-center hidden lg:flex">
  <ul class="menu menu-horizontal px-1 text-dark text-base">
    <li><a href="../../landing-page.php">Home</a></li>
    <li><a href="../../user/tentang.php">Tentang kami</a></li>
    <li>
      <details>
        <summary>Layanan</summary>
        <ul class="bg-light absolute left-1/2 transform -translate-x-1/2 rounded-[10px] border-[1px] shadow-[0px_4px_4px_-0px_rgba(0,0,0,0.25)] border-gray px-[14px] py-[20px] flex flex-wrap items-center gap-3 min-w-[300px] max-w-[600px]">
          <!-- Drop Off -->
          <li>
            <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
              <button onclick="window.location.href='../../user/drop-off/dropoff.php'" class="btn btn-success flex-grow shadow-[0px_4px_4px_-0px_rgba(0,0,0,0.25)] rounded-[20px] flex items-center justify-center px-4 py-2 gap-2 min-w-[120px] max-w-[200px]">
                <img src="../../images/truck.png" class="w-8 h-8" alt="">
                <p>Drop Off</p>
              </button>
            <?php else: ?>
              <button onclick="showModal()" class="btn btn-success flex-grow shadow-[0px_4px_4px_-0px_rgba(0,0,0,0.25)] rounded-[20px] flex items-center justify-center px-4 py-2 gap-2 min-w-[120px] max-w-[200px]">
                <img src="../../images/truck.png" class="w-8 h-8" alt="">
                <p>Drop Off</p>
              </button>
            <?php endif; ?>
          </li>
          <!-- Rewards -->
          <li>
            <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
              <button onclick="window.location.href='../../user/drop-off/poin.php'" class="btn btn-success flex-grow shadow-[0px_4px_4px_-0px_rgba(0,0,0,0.25)] rounded-[20px] flex items-center justify-center px-4 py-2 gap-2 min-w-[120px] max-w-[200px]">
                <img src="../../images/reward.png" class="w-8 h-8" alt="">
                <p>Rewards</p>
              </button>
            <?php else: ?>
              <button onclick="showModal()" class="btn btn-success flex-grow shadow-[0px_4px_4px_-0px_rgba(0,0,0,0.25)] rounded-[20px] flex items-center justify-center px-4 py-2 gap-2 min-w-[120px] max-w-[200px]">
                <img src="../../images/reward.png" class="w-8 h-8" alt="">
                <p>Rewards</p>
              </button>
            <?php endif; ?>
          </li>
         
          <!-- Marketplace -->
          <li>
            <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
              <button onclick="window.location.href='../../user/marketplace/marketplace.php'" class="btn btn-success flex-grow shadow-[0px_4px_4px_-0px_rgba(0,0,0,0.25)] rounded-[20px] flex items-center justify-center px-4 py-2 gap-2 min-w-[120px] max-w-[200px]">
                <img src="../../images/marketplace.png" class="w-8 h-8" alt="">
                <p>Marketplace</p>
              </button>
            <?php else: ?>
              <button onclick="showModal()" class="btn btn-success flex-grow shadow-[0px_4px_4px_-0px_rgba(0,0,0,0.25)] rounded-[20px] flex items-center justify-center px-4 py-2 gap-2 min-w-[120px] max-w-[200px]">
                <img src="../../images/marketplace.png" class="w-8 h-8" alt="">
                <p>Marketplace</p>
              </button>
            <?php endif; ?>
          </li>
        </ul>
      </details>
    </li>
    <li><a href="../../user/blog.php">Blog</a></li>
    <li><a href="../../user/kontak-kami.php">Kontak Kami</a></li>
  </ul>
</div>


<!-- Profile -->
<div class="navbar-end ml-[5px] flex items-center gap-x-0 md:gap-4">
    <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
        <!-- Dropdown User -->
        <div class="relative">
            <button class="font-medium text-sm text-[#1B5E20] focus:outline-none" onclick="toggleDropdown()">
                Halo, <?= htmlspecialchars($_SESSION['user_name']); ?> 
                <svg xmlns="http://www.w3.org/2000/svg" class="inline-block w-4 h-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                </svg>
            </button>
            <div id="dropdownMenu" class="hidden absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-md z-10">
                <a href="../../user/profile.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Profil</a>
                <a href="../../backend/logout.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Logout</a>
            </div>
        </div>
    <?php else: ?>
      <!-- Tombol Sign In dan Sign Up jika belum login -->
        <a href="../../user/signin.php" class="btn md:min-w-[100px] md:h-12 md:shadow-md md:rounded-full md:bg-gradient-to-r from-green to-dark-green md:text-sm md:border md:border-to-r md:from-green md:to-dark-green md:font-medium md:text-white md:text-center text-base bg-transparent text-sm text-[#1B5E20] border-0 shadow-none">
          Sign In
        </a>
        <a href="../../user/signup.php" class="btn btn-outline md:min-w-[100px] md:h-12 md:shadow-md md:border border-to-r from-green to-dark-green md:rounded-full md:text-sm md:font-medium md:text-[#1B5E20] md:text-center text-base bg-transparent text-sm text-[#1B5E20] border-0 shadow-none whitespace-nowrap">
          Sign Up
        </a>
    <?php endif; ?>
</div>

<script>
    // Toggle dropdown visibility
    function toggleDropdown() {
        const dropdown = document.getElementById('dropdownMenu');
        dropdown.classList.toggle('hidden');
    }

    // Close dropdown if clicked outside
    window.addEventListener('click', function(event) {
        const dropdown = document.getElementById('dropdownMenu');
        const button = event.target.closest('button');
        // Jika yang diklik bukan tombol atau dropdown, sembunyikan dropdown
        if (!button || button.getAttribute('onclick') !== 'toggleDropdown()') {
            dropdown.classList.add('hidden');
        }
    });
</script>
    </div>
    <!-- navbar -->
    <script>
        const hamburgerBtn = document.getElementById('hamburger-btn');
        const dropdownMenu = document.getElementById('dropdown-menu');

        hamburgerBtn.addEventListener('click', () => {
            dropdownMenu.classList.toggle('hidden');
        });
    </script>
  <!-- NAVBAR END -->

    <!-- Profile -->
    <div class="navbar-end ml-[5px] flex items-center gap-x-0 md:gap-4">
        <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] === true): ?>
            <div class="relative">
                <button class="font-medium text-sm text-green-600 focus:outline-none" onclick="toggleDropdown()">
                    Halo, <?= htmlspecialchars($_SESSION['user_name']); ?> 
                    <svg xmlns="http://www.w3.org/2000/svg" class="inline-block w-4 h-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                    </svg>
                </button>
                <div id="dropdownMenu" class="hidden absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-md z-10">
                    <a href="../../user/profile.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Profil</a>
                    <a href="../../backend/logout.php" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Logout</a>
                </div>
            </div>
        <?php else: ?>
          <a href="../../user/signin.php" class="btn md:min-w-[100px] md:h-12 md:shadow-md md:rounded-full md:bg-gradient-to-r from-green-600 to-dark-green md:text-sm md:border md:border-to-r md:from-green-600 md:to-dark-green md:font-medium md:text-white md:text-center text-base bg-transparent text-sm text-[#1B5E20] border-0 shadow-none">
            Sign In
          </a>
          <a href="../../user/signup.php" class="btn btn-outline md:min-w-[100px] md:h-12 md:shadow-md md:border border-to-r from-green-600 to-dark-green md:rounded-full md:text-sm md:font-medium md:text-[#1B5E20] md:text-center text-base bg-transparent text-sm text-[#1B5E20] border-0 shadow-none whitespace-nowrap">
            Sign Up
          </a>
        <?php endif; ?>
    </div>
</div>

<!-- Main Content -->
<main class="container mx-auto px-6 py-12 grid grid-cols-1 md:grid-cols-2 gap-8">
    <!-- Product Image -->
    <div class="text-center">
        <img src="<?= htmlspecialchars($row['marketplace_image'] ? '../../images/user/products/' . $row['marketplace_image'] : '../../images/default.jpg'); ?>"  class="rounded-lg shadow-md mx-auto">
        <h2 class="mt-6 text-green-700 text-xl font-bold"><?= htmlspecialchars($row['marketplace_product_name']); ?></h2>
        <p class="text-lg text-gray-700 font-semibold">Rp <?= number_format($row['marketplace_price'], 0, ',', '.'); ?></p>
    </div>

    <!-- Product Details -->
    <div>
        <h2 class="text-green-700 text-2xl font-bold mb-4 hidden md:block"><?= htmlspecialchars($row['marketplace_product_name']); ?></h2>
        <p class="text-lg text-gray-700 font-semibold mb-4 hidden md:block">Rp <?= number_format($row['marketplace_price'], 0, ',', '.'); ?></p>

        <!-- Description Card -->
        <div class="bg-white shadow-md rounded-lg p-6">
            <h3 class="text-green-700 text-xl font-bold">Deskripsi Produk</h3>
            <p class="text-gray-700 mt-4"><?= htmlspecialchars($row['marketplace_description']); ?></p>
        </div>

        <!-- Detail Produk -->
        <div class="bg-white shadow-md rounded-lg p-6 mt-6">
            <h3 class="text-green-700 text-xl font-bold">Detail Produk</h3>
            <ul class="list-disc pl-6 mt-4 space-y-2 text-gray-700">
                <?php 
                if (!empty($row['marketplace_description'])) {
                    $details = explode("\n", $row['marketplace_description']);
                    foreach ($details as $detail) {
                        echo "<li>" . htmlspecialchars(trim($detail)) . "</li>";
                    }
                } else {
                    echo "<li>No product details available.</li>";
                }
                ?>
            </ul>
        </div>

        <!-- Tombol Chat -->
        <div class="mt-6">
        <div class="w-full inline-block text-center bg-gradient-to-r from-green to-dark-green text-white py-3 rounded-lg shadow-md hover:bg-green-700">
    <?php if ($phone_number): ?>
        <a href="https://wa.me/<?= htmlspecialchars($phone_number); ?>?text=Hello,%20I%20am%20interested%20in%20your%20product%21" 
           class="w-full inline-block text-center bg-gradient-to-r from-green-600 to-dark-green text-white py-3 rounded-lg shadow-md hover:bg-green-700">
            Chat dengan penjual
        </a>
    <?php else: ?>
        <p class="text-gray-700">Nomor telepon penjual tidak tersedia.</p>
    <?php endif; ?>
</div>
    </div>
</main>
</body>
</html>
