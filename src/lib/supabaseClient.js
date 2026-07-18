import { createClient } from "@supabase/supabase-js";

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  console.error(
    "Hiányzik a VITE_SUPABASE_URL vagy a VITE_SUPABASE_ANON_KEY környezeti változó. " +
      "Fejlesztéshez hozz létre egy .env fájlt a projekt gyökerében, éles környezetben pedig " +
      "állítsd be ezeket a Vercel projekt Environment Variables menüjében."
  );
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
