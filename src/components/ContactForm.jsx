import { useState } from 'react';

export default function ContactForm() {
  const [status, setStatus] = useState('');
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e) {
    e.preventDefault();
    setLoading(true);
    setStatus('');

    const form = e.target;
    const data = new FormData(form);

    // Honeypot check
    if (data.get('_gotcha')) {
      setStatus('');
      setLoading(false);
      return;
    }

    try {
      const res = await fetch(form.action, {
        method: 'POST',
        body: data,
        headers: { Accept: 'application/json' }
      });

      if (res.ok) {
        setStatus('✅ Pesan berhasil dikirim! Terima kasih.');
        form.reset();
      } else {
        setStatus('❌ Gagal mengirim pesan. Silakan coba lagi.');
      }
    } catch (err) {
      setStatus('❌ Terjadi kesalahan. Silakan coba lagi.');
    } finally {
      setLoading(false);
    }
  }

  return (
    <form
      action="https://formspree.io/f/your-id"
      method="POST"
      onSubmit={handleSubmit}
      className="dark-card p-8"
      aria-describedby="form-status"
    >
      <input type="text" name="_gotcha" className="hidden" tabIndex="-1" aria-hidden="true" />
      <div className="space-y-5">
        <div>
          <label className="block text-sm font-semibold mb-2 text-gray-300" htmlFor="name">
            Nama
          </label>
          <input
            id="name"
            name="name"
            required
            className="w-full rounded-lg border border-gray-600/30 bg-dark-700 text-gray-300 px-4 py-3 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20 transition"
            placeholder="Nama Anda"
          />
        </div>
        <div>
          <label className="block text-sm font-semibold mb-2 text-gray-300" htmlFor="email">
            Email
          </label>
          <input
            id="email"
            name="email"
            type="email"
            required
            className="w-full rounded-lg border border-gray-600/30 bg-dark-700 text-gray-300 px-4 py-3 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20 transition"
            placeholder="email@example.com"
          />
        </div>
        <div>
          <label className="block text-sm font-semibold mb-2 text-gray-300" htmlFor="message">
            Pesan
          </label>
          <textarea
            id="message"
            name="message"
            rows="6"
            required
            className="w-full rounded-lg border border-gray-600/30 bg-dark-700 text-gray-300 px-4 py-3 focus:border-primary-500 focus:outline-none focus:ring-2 focus:ring-primary-500/20 transition resize-none"
            placeholder="Ceritakan tentang proyek atau pertanyaan Anda..."
          ></textarea>
        </div>
        <button
          disabled={loading}
          className="cta-button w-full disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {loading ? 'Mengirim...' : 'Kirim Pesan'}
        </button>
        {status && (
          <p id="form-status" className="text-sm mt-3 text-center text-gray-300" aria-live="polite">
            {status}
          </p>
        )}
      </div>
    </form>
  );
}
